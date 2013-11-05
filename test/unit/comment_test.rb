require File.dirname(__FILE__) + '/../test_helper'

class CommentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
  
  def test_invalid_with_empty_attributes
    comment = Comment.new
    assert !comment.valid?
    assert comment.errors.invalid?(:body)
  end
  
end
