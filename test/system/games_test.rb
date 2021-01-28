require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
   test "visiting the index and create a game" do
     visit games_path
     save_and_open_screenshot

     click_on "Nouveau jeu"

     fill_in "Name", with "Test"
     fill_in "Description", with "Test description"
     fill_in "Note", with 18.0
     fill_in "DatePublished", with "2019-03-16"
     select "1", from "Category"
     select "2", from "Studio"
     select "1", from "Platform"
     save_and_open_screenshot

     click_on "Create Game"
     save_and_open_screenshot

     assert_selector "h1", text: "Test - PS4"
     assert_selector "h2", text: "Iros"
     assert_selector "p", text: "Type : RPG"
     assert_selector "p", text: "Description : Test description"
     assert_selector "p", text: "Note du jeu : 18/20"
     assert_selector "p", text: "Date de publication : 16-03-2019"
     save_and_open_screenshot

   end
end
