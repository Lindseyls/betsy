require "test_helper"

describe CategoriesController do
  describe 'index' do
    it 'sends a success response when there are many categories' do
      Category.count.must_be :>, 0

      # Act
      get categories_path

      # Assert
      must_respond_with :success
    end
  end

  describe 'new' do
    it 'responds with success' do
      # category = Category.first
      get new_category_path

      must_respond_with :success
    end
  end

  describe "create" do
    it "can add a valid category" do
      # Arrange
      category_data = {
        name: 'test category name'
      }
      old_category_count = Category.count

      # Assumption
      Category.new(category_data).must_be :valid?

      # Act
      post categories_path, params: { category: category_data }

      # # Assert
      # # ***The HTTP response below
      # must_respond_with :redirect
      # must_redirect_to categorys_path

      Category.count.must_equal old_category_count + 1
      Category.last.name.must_equal category_data[:name]
    end

    it "won't add an invalid category" do
      # Arrange
      category_data = {
        name: nil
      }
      old_category_count = Category.count

      # Assumption
      Category.new(category_data).wont_be :valid?

      # Act
      post categories_path, params: { category: category_data }

      # Assert
      # must_respond_with :bad_request
      Category.count.must_equal old_category_count
    end
  end

end
