#include "util/modulus.h"
#include "util/uintcore.h"
#include "util/uintarith.h"

using namespace std;

namespace seal
{
    namespace util
    {
        namespace
        {
            bool is_inverse_small(const uint64_t *operand, int bit_count)
            {
                const int fast_mod_threshold = 5;
                // We know operand has a '1' at position bit_count, but we only care about bits bit_count - 1
                // because result will have a '0' at position bit_count and this allows us to handle case
                // operand is of form one bit followed by all zeros.
                bit_count--;
                int uint64_count = divide_round_up(bit_count, bits_per_uint64);
                int high_value_bits = bit_count % bits_per_uint64;
                uint64_t high_value_filter = (static_cast<uint64_t>(1) << high_value_bits) - 1;
                int sig_bit_count = 0;
                bool carry = true;
                for (int i = 0; i < uint64_count; ++i)
                {
                    uint64_t value = ~*operand++;
                    uint64_t sum = value;
                    if (carry)
                    {
                        sum++;
                        carry = sum == 0;
                    }
                    if (i == uint64_count - 1)
                    {
                        sum &= high_value_filter;
                    }
                    if (sum != 0)
                    {
                        sig_bit_count = get_significant_bit_count(sum) + (i * bits_per_uint64);
                    }
                }
                return bit_count - sig_bit_count >= fast_mod_threshold;
            }
        }

        Modulus::Modulus() : modulus_(nullptr), uint64_count_(0), significant_bit_count_(0), power_of_two_minus_one_(-1)
        {
        }

        Modulus::Modulus(const std::uint64_t *modulus, int uint64_count) : modulus_(modulus), uint64_count_(uint64_count), power_of_two_minus_one_(-1)
        {
#ifdef _DEBUG
            if (modulus == nullptr)
            {
                throw invalid_argument("modulus");
            }
            if (uint64_count <= 0)
            {
                throw invalid_argument("uint64_count");
            }
            if (is_zero_uint(modulus, uint64_count))
            {
                throw invalid_argument("modulus");
            }
#endif
            significant_bit_count_ = get_significant_bit_count_uint(modulus, uint64_count);
            power_of_two_minus_one_ = get_power_of_two_minus_one_uint(modulus, uint64_count);
            if (is_inverse_small(modulus, significant_bit_count_))
            {
                // Calculate inverse modulus (clipped to modulus_bits).
                inverse_modulus_ = Pointer::Owning(new uint64_t[uint64_count]);
                negate_uint(modulus, uint64_count, inverse_modulus_.get());
                filter_highbits_uint(inverse_modulus_.get(), uint64_count, significant_bit_count_ - 1);
            }
        }

        Modulus::Modulus(const std::uint64_t *modulus, int uint64_count, MemoryPool &pool) : modulus_(modulus), uint64_count_(uint64_count), power_of_two_minus_one_(-1)
        {
#ifdef _DEBUG
            if (modulus == nullptr)
            {
                throw invalid_argument("modulus");
            }
            if (uint64_count <= 0)
            {
                throw invalid_argument("uint64_count");
            }
            if (is_zero_uint(modulus, uint64_count))
            {
                throw invalid_argument("modulus");
            }
#endif
            significant_bit_count_ = get_significant_bit_count_uint(modulus, uint64_count);
            power_of_two_minus_one_ = get_power_of_two_minus_one_uint(modulus, uint64_count);
            if (is_inverse_small(modulus, significant_bit_count_))
            {
                // Calculate inverse modulus (clipped to modulus_bits).
                inverse_modulus_ = allocate_uint(uint64_count, pool);
                negate_uint(modulus, uint64_count, inverse_modulus_.get());
                filter_highbits_uint(inverse_modulus_.get(), uint64_count, significant_bit_count_ - 1);
            }
        }

        Modulus::Modulus(Modulus &&move) : modulus_(move.modulus_), uint64_count_(move.uint64_count_), significant_bit_count_(move.significant_bit_count_), power_of_two_minus_one_(move.power_of_two_minus_one_)
        {
            inverse_modulus_.acquire(move.inverse_modulus_);
        }

        Modulus &Modulus::operator =(Modulus &&assign)
        {
            modulus_ = assign.modulus_;
            uint64_count_ = assign.uint64_count_;
            significant_bit_count_ = assign.significant_bit_count_;
            power_of_two_minus_one_ = assign.power_of_two_minus_one_;
            inverse_modulus_.acquire(assign.inverse_modulus_);
            return *this;
        }
    }
}