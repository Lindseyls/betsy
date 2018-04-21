require "test_helper"

describe ReviewsController do
  # describe "index" do
  #   it "succeeds when there are users" do
  #     # Assumption instead of Arrange
  #     # Check your assumption
  #     User.count.must_be :>, 0
  #
  #     # Act
  #     get users_path
  #
  #     # Assert
  #     must_respond_with :success
  #   end
  # end

  describe "new" do
    it " responds with success" do
      get new_product_review_path

      must_respond_with :success
    end
  end

  # describe "create" do
  #   it "creates a work with valid data for a real category" do
  #     # Arrange
  #     work_data = {
  #       title: 'controller test work',
  #       category: 'movie',
  #       creator: 'test creator'
  #     }
  #     work = Work.new(work_data)
  #     old_work_count = Work.count
  #
  #     # Assumption
  #     work.must_be :valid?
  #
  #     # Act
  #     post works_path, params: { work: work_data }
  #
  #     # Assert
  #     must_respond_with :redirect
  #     must_redirect_to work_path(Work.last)
  #
  #     Work.count.must_equal old_work_count + 1
  #     Work.last.category.must_equal work_data[:category]
  #     end
  # end
end
