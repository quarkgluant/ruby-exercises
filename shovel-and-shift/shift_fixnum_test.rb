gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/homework'

class ShiftFixnumTest < Minitest::Homework
  self.be_gentle!

  def test_object_ids_of_fixnums
    i1 = 1
    i2 = 1
    assert i1.object_id == i2.object_id

    i1 = 1
    i2 = 2
    assert (i1 + i2).object_id == 3.object_id
  end

  def test_fixnums_in_binary
    assert_equal "1", 1.to_s(2)
    assert_equal "10", 2.to_s(2)
    assert_equal "11", 3.to_s(2)
    assert_equal "100", 4.to_s(2)
    assert_equal "101", 5.to_s(2)
    assert_equal "110", 6.to_s(2)
    assert_equal "111", 7.to_s(2)
    assert_equal "1000", 8.to_s(2)
    assert_equal "1001", 9.to_s(2)
    assert_equal "1010", 10.to_s(2)
  end

  def test_shift_left_on_fixnum
    i1 = 1 << 1
    i2 = 1 << 2
    i3 = 1 << 3
    i4 = 1 << 4
    i5 = 1 << 5
    i6 = 1 << 6

    assert_equal 2, i1
    assert_equal 4, i2
    assert_equal 8, i3
    assert_equal 16, i4
    assert_equal 32, i5
    assert_equal 64, i6

    # Now let's look at these numbers in binary.
    assert_equal "10", i1.to_s(2)
    assert_equal "100", i2.to_s(2)
    assert_equal "1000", i3.to_s(2)
    assert_equal "10000", i4.to_s(2)
    assert_equal "100000", i5.to_s(2)
    assert_equal "1000000", i6.to_s(2)
  end

  def test_shift_left_on_fixnum_with_negative_numbers
    i1 = 64 << -1
    i2 = 64 << -2
    i3 = 64 << -3
    i4 = 64 << -4
    i5 = 64 << -5
    i6 = 64 << -6

    assert_equal 32, i1
    assert_equal 16, i2
    assert_equal 8, i3
    assert_equal 4, i4
    assert_equal 2, i5
    assert_equal 1, i6
  end

  def test_shift_right_on_fixnum
    i1 = 64 >> 1
    i2 = 64 >> 2
    i3 = 64 >> 3
    i4 = 64 >> 4
    i5 = 64 >> 5
    i6 = 64 >> 6

    assert_equal 32, i1
    assert_equal 16, i2
    assert_equal 8, i3
    assert_equal 4, i4
    assert_equal 2, i5
    assert_equal 1, i6
  end

  def test_shift_right_on_fixnum_with_negative_numbers
    i1 = 1 >> -1
    i2 = 1 >> -2
    i3 = 1 >> -3
    i4 = 1 >> -4
    i5 = 1 >> -5
    i6 = 1 >> -6

    assert_equal 2, i1
    assert_equal 4, i2
    assert_equal 8, i3
    assert_equal 16, i4
    assert_equal 32, i5
    assert_equal 64, i6
  end

  def test_more_shifty_business_on_fixnum
    i1 = 7 << 1
    i2 = 7 << 2
    i3 = 7 << 3

    assert_equal 14, i1
    assert_equal 28, i2
    assert_equal 56, i3

    assert_equal "1110", i1.to_s(2)
    assert_equal "11100", i2.to_s(2)
    assert_equal "111000", i3.to_s(2)

    i1 = 52 >> 1
    i2 = 52 >> 2
    i3 = 52 >> 3

    assert_equal 26, i1
    assert_equal 13, i2
    assert_equal 6, i3

    assert_equal "11010", i1.to_s(2)
    assert_equal "1101", i2.to_s(2)
    assert_equal "110", i3.to_s(2)

    i1 = 79 >> 1
    i2 = 79 >> 2
    i3 = 79 >> 3

    assert_equal 39, i1
    assert_equal 19, i2
    assert_equal 9, i3

    assert_equal "100111", i1.to_s(2)
    assert_equal "10011", i2.to_s(2)
    assert_equal "1001", i3.to_s(2)
  end

  # Explain in English what `<<` and `>>` do to a number.
  # multiply or divide by 2 the number by shifting a 0 or unshifting the last bit
end
