require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    # request.headers['Authorization'] = ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')
    @article = articles(:one)
  end

  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params: { article: { body: 'Rails is awesome!', title: 'Hello Rails' } }
    end

    assert_redirected_to article_url(Article.last)
    assert_equal 'Article was successfully created.', flash[:notice]
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: { article: { body: 'Rails is awesome! 2', title: 'Hello Rails 2' } }
    assert_redirected_to article_url(@article)
    @article.reload
    assert_equal "Hello Rails 2", @article.title
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end
end
