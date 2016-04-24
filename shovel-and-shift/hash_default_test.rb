gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/homework'

class HashDefaultTest < Minitest::Homework
  self.be_gentle!

  def test_sometimes_syntax_error
    # These all work.
    assert_equal({}, {})
    assert_equal({}, Hash.new)
    expected = {}
    assert_equal expected, {}

    # This one fails. Fix it.
    assert_equal({}, Hash.new)
  end

  def test_default_array_as_argument
    lists = Hash.new([])

    assert_equal({}, lists)
    assert_equal [], lists[:a]
    assert_equal [], lists[:b]
    assert lists[:a].object_id == lists[:b].object_id
  end

  def test_default_array_as_block
    lists = Hash.new { [] }

    assert_equal({}, lists)
    assert_equal [], lists[:a]
    assert_equal [], lists[:b]
    refute lists[:a].object_id == lists[:b].object_id
  end

  def test_default_string_as_argument
    lists = Hash.new("")

    assert_equal({}, lists)
    assert_equal "", lists[:a]
    assert_equal "", lists[:b]
    assert lists[:a].object_id == lists[:b].object_id
  end

  def test_default_string_as_block
    lists = Hash.new { "" }

    assert_equal({}, lists)
    assert_equal "", lists[:a]
    assert_equal "", lists[:b]
    refute lists[:a].object_id == lists[:b].object_id
  end

  def test_default_numbers_as_argument
    lists = Hash.new(0)

    assert_equal({}, lists)
    assert_equal 0, lists[:a]
    assert_equal 0, lists[:b]
    assert lists[:a].object_id == lists[:b].object_id
  end

  def test_default_numbers_as_block
    lists = Hash.new { 0 }

    assert_equal({}, lists)
    assert_equal 0, lists[:a]
    assert_equal 0, lists[:b]
    assert lists[:a].object_id == lists[:b].object_id
  end

  def test_grade_school_1
    school = Hash.new([])
    assert_equal({}, school) # error written "lists" , expected "school"

    school['first grade'] << "Alice"
    school['first grade'] << "Bob"
    school['second grade'] << "Charlie"

    assert_equal ["Alice", "Bob", "Charlie"], school['first grade']
    assert_equal ["Alice", "Bob", "Charlie"], school['second grade']
    assert_equal ["Alice", "Bob", "Charlie"], school['thirdgrade']
    assert_equal({}, school)  # error written "lists" , expected "school"
  end

  def test_grade_school_2
    school = Hash.new { [] }
    assert_equal({}, school)

    school['first grade'] << "Alice"
    school['first grade'] << "Bob"
    school['second grade'] << "Charlie"

    assert_equal [], school['first grade']
    assert_equal [], school['second grade']
    assert_equal [], school['third grade']
    assert_equal({}, school)
  end

  def test_grade_school_3
    school = Hash.new { |hash, key| hash[key] = [] }
    assert_equal({}, school)

    school['first grade'] << "Alice"
    school['first grade'] << "Bob"
    school['second grade'] << "Charlie"

    assert_equal ["Alice", "Bob"], school['first grade']
    assert_equal ["Charlie"], school['second grade']
    assert_equal [], school['third grade']
    assert_equal({"first grade"=>["Alice", "Bob"], "second grade"=>["Charlie"], "third grade"=>[]}, school)
  end

  def test_grade_school_4
    school = Hash.new([])
    assert_equal({}, school)

    school['first grade'] += ["Alice"]
    school['first grade'] += ["Bob"]
    school['second grade'] += ["Charlie"]

    assert_equal ["Alice", "Bob"], school['first grade']
    assert_equal ["Charlie"], school['second grade']
    assert_equal [], school['third grade']
    assert_equal({"first grade"=>["Alice", "Bob"], "second grade"=>["Charlie"]}, school)
  end

  def test_word_stem_1
    words = Hash.new('de')
    assert_equal({}, words)

    word1 = words[1] << 'fault'
    word2 = words[2] << 'cide'
    word3 = words[3] << 'spair'
    word4 = words[4] << 'bunk'
    word5 = words[5] << 'rail'

    assert_equal "defaultcidespairbunkrail", word1
    assert_equal "defaultcidespairbunkrail", word2
    assert_equal "defaultcidespairbunkrail", word3
    assert_equal "defaultcidespairbunkrail", word4
    assert_equal "defaultcidespairbunkrail", word5

    assert_equal({}, words)
  end

  def test_word_stem_2
    words = Hash.new { 'de' }
    assert_equal({}, words)

    word1 = words[1] << 'fault'
    word2 = words[2] << 'cide'
    word3 = words[3] << 'spair'
    word4 = words[4] << 'bunk'
    word5 = words[5] << 'rail'

    assert_equal "default", word1
    assert_equal "decide", word2
    assert_equal "despair", word3
    assert_equal "debunk", word4
    assert_equal "derail", word5

    assert_equal({}, words)
  end

  def test_word_stem_3
    words = Hash.new { |hash, key| hash[key] = 'de' }
    assert_equal({}, words)

    word1 = words[1] << 'fault'
    word2 = words[2] << 'cide'
    word3 = words[3] << 'spair'
    word4 = words[4] << 'bunk'
    word5 = words[5] << 'rail'

    assert_equal "default", word1
    assert_equal "decide", word2
    assert_equal "despair", word3
    assert_equal "debunk", word4
    assert_equal "derail", word5

    assert_equal( {1=>"default", 2=>"decide", 3=>"despair", 4=>"debunk", 5=>"derail"}, words)
  end

  def test_word_stem_4
    words = Hash.new('de')
    assert_equal({}, words)

    word1 = words[1] += 'fault'
    word2 = words[2] += 'cide'
    word3 = words[3] += 'spair'
    word4 = words[4] += 'bunk'
    word5 = words[5] += 'rail'

    assert_equal "default", word1
    assert_equal "decide", word2
    assert_equal "despair", word3
    assert_equal "debunk", word4
    assert_equal "derail", word5

    assert_equal( {1=>"default", 2=>"decide", 3=>"despair", 4=>"debunk", 5=>"derail"}, words)
  end
end
