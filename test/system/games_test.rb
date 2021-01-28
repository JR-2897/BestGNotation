require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
   test "visiting the index and create a game" do
     visit games_path
     fill_in "Email", with: "admin@gmail.com"
     fill_in "Password", with: "adminadmin"
     click_on "Log in"

     save_and_open_screenshot

     click_on "Nouveau jeu"

     fill_in "Name", with: "Test"
     fill_in "Description", with: "Test description"
     
    #  select "2019",  from: "Datepublished_1i" # Year.
    #  select "03",  from: "Datepublished_2i" # Month.
    #  select "16", from: "Datepublished_3i" # Day.
    #  select "1", from: "Category"
    #  select "2", from: "Studio"
    #  select "1", from: "Platform"
     save_and_open_screenshot

     click_on "Create Game"
     save_and_open_screenshot

     assert_selector "h1", text: "Test - PC"
     assert_selector "h2", text: "Tito"
     assert_selector "p", text: "Type : RPG"
     assert_selector "p", text: "Description :\nTest description"
     assert_selector "p", text: "Pas encore noté."
     assert_selector "p", text: "Date de publication : 2021-01-29"
     save_and_open_screenshot

   end
end
