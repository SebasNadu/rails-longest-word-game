require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit games_url
  #
  #   assert_selector "h1", text: "Games"
  # end
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end
  test "Fill the formular with a word and click play and display a message" do
  visit new_url
  assert test: "New word"
  fill_in "word", with: "word"
  click_on "Play!"
  assert_text "Result\nSorry but WORD can't be built out of #{@example}.\nscore:\nPlay again"
  end

  test "Fill the formular with a no english word and click play and display a message" do
  visit new_url
  assert test: "New no english word"
  fill_in "word", with: @letters
  click_on "Play!"
  assert_text "Result\nSorry but does not seem to be a valid English word..\nscore:\nPlay again"
  end
end
