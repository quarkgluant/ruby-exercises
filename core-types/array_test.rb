gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/homework'

class ArrayTest < Minitest::Homework
  be_gentle!

  def test_empty
    assert_equal true, [].empty?
    assert_equal false, [1,2,3].empty?
  end

  def test_first
    assert_equal nil, [].first
    assert_equal :a, [:a, :b, :c].first
    assert_equal "spoon", ["spoon"].first
  end

  def test_last
    assert_equal nil, [].last
    assert_equal :c, [:a, :b, :c].last
    assert_equal "spoon", ["spoon"].last
  end

  def test_access
    assert_equal nil, [][0]
    assert_equal "a", ["a", "b", "c"][0]
    assert_equal "b", ["a", "b", "c"][1]
    assert_equal "c", ["a", "b", "c"][-1]
    assert_equal "b", ["a", "b", "c"][-2]
    assert_equal nil, ["a", "b", "c"][4]
  end

  def test_index
    assert_equal 0, ["a", "b", "c"].index("a")
    assert_equal 1, ["a", "b", "c"].index("b")
    assert_equal 2, ["a", "b", "c"].index("c")
    assert_equal nil, ["a", "b", "c"].index("d")
  end

  def test_join
    assert_equal "", [].join
    assert_equal "", [].join(' ')
    assert_equal "", [].join(' - ')
    assert_equal "", [].join(' and ')
    assert_equal "abc", ["a", "b", "c"].join
    assert_equal "abc", ["a", "b", "c"].join("")
    assert_equal "a b c", ["a", "b", "c"].join(" ")
    assert_equal "a-b-c", ["a", "b", "c"].join(" - ")
    assert_equal "a and b and c", ["a", "b", "c"].join(" and ")
  end

  def test_length
    assert_equal 0, [].length
    assert_equal 1, [:a].length
    assert_equal 2, [:a, :b].length
    assert_equal 3, [:a, :b, :c].length
  end

  def test_reverse
    assert_equal [3, 2, 1], [1, 2, 3].reverse
    assert_equal [:c, :b, :a], [:a, :b, :c].reverse
  end

  def test_take
    assert_equal [], [].take(1)
    assert_equal [], [].take(2)
    assert_equal [a, b, c], ["a", "b", "c", "d", "e"].take(3)

    words = ["fish", "boy", "pumpkin", "flower"]
    assert_equal ["fish", "boy"], words.take(2)
    assert_equal words.take(4), words
  end

  def test_plus
    a1 = [] + []
    a2 = [] + [:a]
    a3 = [:a] + [:b]
    a4 = [:a, :b] + [:b, :c]

    assert_equal [], a1
    assert_equal [:a], a2
    assert_equal [:a, :b], a3
    assert_equal [:a, :b, :b, :c], a4
  end

  def test_concat
    assert_equal __, [].concat([:a])
    assert_equal __, [:a].concat([:b])
    assert_equal __, [:a, :b].concat([:b, :c])
  end

  def test_shovel
    a1 = [] << []
    a2 = [] << nil
    a3 = [] << :a
    a4 = [:a] << :b
    a5 = [:a, :b] << :c
    a6 = [:a, :b] << :b

    assert_equal __, a1
    assert_equal __, a2
    assert_equal __, a3
    assert_equal __, a4
    assert_equal __, a5
    assert_equal __, a6
  end

  def test_minus
    a1 = [] - []
    a2 = [:a] - []
    a3 = [:a, :b, :c] - [:a]
    a4 = [:a, :b, :c] - [:a, :b]
    a5 = [:a, :b, :a, :c, :a] - [:a]

    assert_equal __, a1
    assert_equal __, a2
    assert_equal __, a3
    assert_equal __, a4
    assert_equal __, a5
  end

  def test_pipe
    a1 = [] | []
    a2 = [] | [:a]
    a3 = [:a] | [:b]
    a4 = [:a, :b] | [:b, :c]
    a5 = [:a, :b, :b] | [:b, :b, :c]

    assert_equal __, a1
    assert_equal __, a2
    assert_equal __, a3
    assert_equal __, a4
    assert_equal __, a5
  end

  def test_ampersand
    a1 = [] & []
    a2 = [] & [:a]
    a3 = [:a] & [:b]
    a4 = [:a, :b] & [:b, :c]
    a5 = [:a, :b, :b] & [:b, :b, :c]

    assert_equal __, a1
    assert_equal __, a2
    assert_equal __, a3
    assert_equal __, a4
    assert_equal __, a5
  end

  class Wrapper
    attr_reader :value
    def initialize(value)
      @value = value
    end

    def inspect
      "#<Wrapper #{object_id}>"
    end
  end

  def test_intersection_of_objects
    a = Wrapper.new(:a)
    b = Wrapper.new(:b)
    b1 = Wrapper.new(:b)
    b2 = Wrapper.new(:b)
    c = Wrapper.new(:c)

    a1 = [a, b] & [b, c]
    a2 = [a, b1] & [b2, c]
    a3 = [a, b1, b2] & [b1, b2, c]

    assert_equal [b], a1
    assert_equal [], a2
    assert_equal [b1, b2], a3
  end

  def test_uniq
    assert_equal __, [].uniq
    assert_equal __, [:a].uniq
    assert_equal __, [:a, :a, :a, :b].uniq
  end

  def test_push
    assert_equal __, [].push(:a)
    assert_equal __, [].push(nil)
    assert_equal __, [].push([])
    assert_equal __, [:a].push(:b)
    assert_equal __, [:a, :b].push(:c)
    assert_equal __, [1, "apple", :c].push(["fish", 7, :x])
  end

  def test_shift
    assert_equal __, [].shift
    assert_equal __, [:a].shift
    assert_equal __, [:a, :b].shift
  end

  def test_pop
    assert_equal __, [].pop
    assert_equal __, [:a].pop
    assert_equal __, [:a, :b].pop
  end

  def test_unshift
    assert_equal __, [].unshift(:a)
    assert_equal __, [].unshift(nil)
    assert_equal __, [].unshift([])
    assert_equal __, [:a].unshift(:b)
    assert_equal __, [:a, :b].unshift(:c)
    assert_equal __, [1, "apple", :c].unshift(["fish", 7, :x])
  end

  def test_parallel_assignment
    fruit = ["apple", "banana", "cherry", "dewberry"]

    a, b, c, d = fruit
    assert_equal __, a
    assert_equal __, b
    assert_equal __, c
    assert_equal __, d

    a, b = fruit
    assert_equal __, a
    assert_equal __, b

    a, *b = fruit
    assert_equal __, a
    assert_equal __, b

    *a, b = fruit
    assert_equal __, a
    assert_equal __, b

    a, b, *c = fruit
    assert_equal __, a
    assert_equal __, b
    assert_equal __, c

    *a, b, c = fruit
    assert_equal __, a
    assert_equal __, b
    assert_equal __, c

    a, *b, c = fruit
    assert_equal __, a
    assert_equal __, b
    assert_equal __, c
  end

  def test_delete
    protein = ["fish", "bacon", "chicken", "bacon", "bacon", "steak"]

    deleted = protein.delete("fish")
    assert_equal __, deleted
    assert_equal __, protein

    deleted = protein.delete("bacon")
    assert_equal __, deleted
    assert_equal __, protein
  end

  def test_delete_at
    veggies = ["carrot", "parsnip", "courgette"]
    veggie = veggies.delete_at(1)
    assert_equal __, veggie
    assert_equal __, veggies
  end

  def test_compact
    assert_equal __, ["a", "b", "c"].compact
    assert_equal __, ["a", nil, "b", "c", nil, nil].compact
    assert_equal __, [nil].compact
  end

  def test_flatten
    assert_equal __, [:a, :b, :c].flatten
    assert_equal __, [:a, [:b, :c]].flatten
    assert_equal __, [:a, [:b, [:c]], [:d], :e, [:f, :g]].flatten
  end

  # Uhm. Halp?
  def test_shuffle
    # Go try this in IRB a few times
    # ["a", "b", "c", "d"].shuffle
  end

  def test_sample
    # Go try this in IRB a few times
    # ["a", "b", "c", "d"].sample
  end
end
