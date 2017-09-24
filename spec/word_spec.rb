require('rspec')
require('word')
require('pry')

describe(".empty") do
  it("empties class array of words") do
    dog = Word.new({:word => "dog"})
    cat = Word.new({:word => "cat"})
    rabbit = Word.new({:word => "rabbit"})
    dog.save()
    cat.save()
    rabbit.save()
    expect(Word.empty()).to(eq([]))
  end
end

describe("Word") do
  it ("creates instance of word class when given a word") do
    love = Word.new({:word => "love"})
    expect(love.word).to(eq("love"))
  end
end

describe(".all") do
  it("can return a list of all saved words, empty at first") do
    expect(Word.all).to(eq([]))
  end
end

describe(".save") do
  it("saves each word into a list of words") do
    love = Word.new({:word => "love"})
    love.save()
    hate = Word.new({:word => "hate"})
    hate.save()
    expect(Word.all).to(eq([love, hate]))
  end
end

describe("#defintion") do
  it("adds definition to word") do
    love = Word.new({:word => "love"})
    love.add_definition("an intense feeling of deep affection")
    expect(love.definition).to(eq(["an intense feeling of deep affection"]))
  end
end

describe(".find_word") do
  it("finds word object when given the word") do
    Word.empty()
    love = Word.new({:word => "love"})
    hate = Word.new({:word => "hate"})
    love.save()
    hate.save()
    expect(Word.find_word("love")).to(eq(love))
  end
end

describe(".sort") do
  it("sorts array of words") do
    Word.empty()
    love = Word.new({:word => "love"})
    hate = Word.new({:word => "hate"})
    love.save()
    hate.save()
    Word.sort()
    expect(Word.all()).to(eq([hate, love]))
  end
end
