require "spec_helper"

describe "Enumerable#first_and_only!" do

  shared_examples_for "it_has_one_element" do
    specify { expect(subject.first_and_only!).to eq(:element) }
  end

  shared_examples_for "it_is_empty" do
    specify do
      expect { subject.first_and_only! }.to \
        raise_error(Enumerable::FirstAndOnly::LengthNotOne, "0")
    end
  end

  shared_examples_for "it_has_more_than_one_element" do
    specify do
      fail "bad example" if subject.count < 2

      expect { subject.first_and_only! }.to \
        raise_error(Enumerable::FirstAndOnly::LengthNotOne, subject.count.to_s)
    end
  end

  describe "an array" do

    context "with one element" do
      subject { [:element] }
      it_behaves_like "it_has_one_element"
    end

    context "that is empty" do
      subject { [] }
      it_behaves_like "it_is_empty"
    end

    context "with two elements" do
      subject { [:element, :element] }
      it_behaves_like "it_has_more_than_one_element"
    end
  end

  describe "any enumerable" do
    let(:my_enumerable) do
      Class.new do
        include Enumerable

        def initialize *args
          @args = args
        end

        def each
          @args.each { |arg| yield(arg) }
        end
      end
    end

    context "with one element" do
      subject { my_enumerable.new(:element) }
      it_behaves_like "it_has_one_element"
    end

    context "empty" do
      subject { my_enumerable.new() }
      it_behaves_like "it_is_empty"
    end

    context "with more than on element" do
      subject { my_enumerable.new(:element, :element) }
      it_behaves_like "it_has_more_than_one_element"
    end

  end

end
