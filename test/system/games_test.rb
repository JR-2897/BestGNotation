require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
   test "visiting the index and create a game" do
     visit games_path
     assert_selector "h1", text: "Jeu"

     click_on "Nouveau jeu"

     fill_in "Name", with "Test"
     fill_in "Description", with "Test description"
     fill_in "Note", with 18.0
     fill_in "DatePublished", with "2019-03-16"
     select "3", from "Category"
     select "5", from "Studio"
     select "4", from "Platform"
     save_and_open_screenshot

     click_on "Create Game"
     save_and_open_screenshot

     assert_selector "h1", text: "Test - Nintendo Switch"
     assert_selector "h2", text: "Steel Wool Studios"

   end
end
