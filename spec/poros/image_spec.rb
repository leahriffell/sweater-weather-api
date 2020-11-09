require 'rails_helper'

RSpec.describe 'Image poro' do
  it 'exists' do 
    attr = {
            :total=>1399,
            :total_pages=>1399,
            :results=>
            [{:id=>"36XAdOONlxc",
              :created_at=>"2020-01-14T01:34:26-05:00",
              :updated_at=>"2020-11-08T08:09:57-05:00",
              :promoted_at=>nil,
              :width=>6000,
              :height=>4000,
              :color=>"#130E0B",
              :blur_hash=>"LFP6,E~pxv?vMdxuo#%g%fRPD%IA",
              :description=>"Sleeping Owl",
              :alt_description=>nil,
              :urls=>
                {:raw=>"https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE4MTA0N30",
                :full=>"https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE4MTA0N30",
                :regular=>
                  "https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE4MTA0N30",
                :small=>
                  "https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjE4MTA0N30",
                :thumb=>
                  "https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE4MTA0N30"},
              :links=>
                {:self=>"https://api.unsplash.com/photos/36XAdOONlxc",
                :html=>"https://unsplash.com/photos/36XAdOONlxc",
                :download=>"https://unsplash.com/photos/36XAdOONlxc/download",
                :download_location=>"https://api.unsplash.com/photos/36XAdOONlxc/download"},
              :categories=>[],
              :likes=>5,
              :liked_by_user=>false,
              :current_user_collections=>[],
              :sponsorship=>nil,
              :user=>
                {:id=>"FNDAToNnUJc",
                :updated_at=>"2020-11-07T20:13:08-05:00",
                :username=>"joshua_forbes",
                :name=>"Joshua Forbes",
                :first_name=>"Joshua",
                :last_name=>"Forbes",
                :twitter_username=>"JustJoshSA",
                :portfolio_url=>"https://www.joshuaforbes.co.za",
                :bio=>"IG: @joshua_forbes\r\nTW: @JustJoshSA\r\nFB: @JustJoshZA\r\n\r\nhttps://www.joshuaforbes.co.za ",
                :location=>"South Africa",
                :links=>
                  {:self=>"https://api.unsplash.com/users/joshua_forbes",
                  :html=>"https://unsplash.com/@joshua_forbes",
                  :photos=>"https://api.unsplash.com/users/joshua_forbes/photos",
                  :likes=>"https://api.unsplash.com/users/joshua_forbes/likes",
                  :portfolio=>"https://api.unsplash.com/users/joshua_forbes/portfolio",
                  :following=>"https://api.unsplash.com/users/joshua_forbes/following",
                  :followers=>"https://api.unsplash.com/users/joshua_forbes/followers"},
                :profile_image=>
                  {:small=>"https://images.unsplash.com/profile-1500881487277-547e141db773?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                  :medium=>"https://images.unsplash.com/profile-1500881487277-547e141db773?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                  :large=>"https://images.unsplash.com/profile-1500881487277-547e141db773?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},
                :instagram_username=>"joshua_forbes",
                :total_collections=>0,
                :total_likes=>304,
                :total_photos=>86,
                :accepted_tos=>true},
              :tags=>
                [{:type=>"search", :title=>"denver"},
                {:type=>"landing_page",
                  :title=>"animal",
                  :source=>
                  {:ancestry=>{:type=>{:slug=>"images", :pretty_slug=>"Images"}, :category=>{:slug=>"animals", :pretty_slug=>"Animals"}},
                    :title=>"Animals Images & Pictures",
                    :subtitle=>"Download free animals images",
                    :description=>
                    "Passionate photographers have captured the most gorgeous animals in the world in their natural habitats and shared them with Unsplash. Now you can use these photos however you wish, for free!",
                    :meta_title=>"Best 20+ Animals Pictures [HD] | Download Free Images on Unsplash",
                    :meta_description=>"Choose from hundreds of free animals pictures. Download HD animals photos for free on Unsplash.",
                    :cover_photo=>
                    {:id=>"YozNeHM8MaA",
                      :created_at=>"2017-04-18T13:00:04-04:00",
                      :updated_at=>"2020-10-21T01:26:13-04:00",
                      :promoted_at=>"2017-04-19T13:54:55-04:00",
                      :width=>5184,
                      :height=>3456,
                      :color=>"#120803",
                      :blur_hash=>"LPR{0ext~pIU%MRQM{%M%LozIBM|",
                      :description=>
                      "I met this dude on safari in Kruger National park in northern South Africa. The giraffes were easily in my favorite creatures to witness. They seemed almost prehistoric the the way the graced the African plain.",
                      :alt_description=>"selective focus photography of giraffe",
                      :urls=>
                      {:raw=>"https://images.unsplash.com/photo-1492534513006-37715f336a39?ixlib=rb-1.2.1",
                        :full=>"https://images.unsplash.com/photo-1492534513006-37715f336a39?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb",
                        :regular=>"https://images.unsplash.com/photo-1492534513006-37715f336a39?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max",
                        :small=>"https://images.unsplash.com/photo-1492534513006-37715f336a39?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max",
                        :thumb=>"https://images.unsplash.com/photo-1492534513006-37715f336a39?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max"},
                      :links=>
                      {:self=>"https://api.unsplash.com/photos/YozNeHM8MaA",
                        :html=>"https://unsplash.com/photos/YozNeHM8MaA",
                        :download=>"https://unsplash.com/photos/YozNeHM8MaA/download",
                        :download_location=>"https://api.unsplash.com/photos/YozNeHM8MaA/download"},
                      :categories=>[],
                      :likes=>1308,
                      :liked_by_user=>false,
                      :current_user_collections=>[],
                      :sponsorship=>nil,
                      :user=>
                      {:id=>"J6cg9TA8-e8",
                        :updated_at=>"2020-10-21T08:29:30-04:00",
                        :username=>"judahlegge",
                        :name=>"Judah Legge",
                        :first_name=>"Judah",
                        :last_name=>"Legge",
                        :twitter_username=>nil,
                        :portfolio_url=>nil,
                        :bio=>nil,
                        :location=>nil,
                        :links=>
                        {:self=>"https://api.unsplash.com/users/judahlegge",
                          :html=>"https://unsplash.com/@judahlegge",
                          :photos=>"https://api.unsplash.com/users/judahlegge/photos",
                          :likes=>"https://api.unsplash.com/users/judahlegge/likes",
                          :portfolio=>"https://api.unsplash.com/users/judahlegge/portfolio",
                          :following=>"https://api.unsplash.com/users/judahlegge/following",
                          :followers=>"https://api.unsplash.com/users/judahlegge/followers"},
                        :profile_image=>
                        {:small=>
                          "https://images.unsplash.com/profile-fb-1492532922-001f65e39343.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                          :medium=>
                          "https://images.unsplash.com/profile-fb-1492532922-001f65e39343.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                          :large=>
                          "https://images.unsplash.com/profile-fb-1492532922-001f65e39343.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},
                        :instagram_username=>nil,
                        :total_collections=>0,
                        :total_likes=>4,
                        :total_photos=>1,
                        :accepted_tos=>false}}}},
                {:type=>"search", :title=>"zoo entrance"}]}]
              }
    
    symbolized = attr.deep_symbolize_keys
    
    image = Image.new(symbolized)

    expect(image).to be_an(Image)

    expect(image.description).to eq(symbolized[:results][0][:description])
    expect(image.url).to eq(symbolized[:results][0][:urls][:regular])
    
    expect(image.credits).to be_a(Hash)
    expect(image.credits[:artist_username]).to eq(symbolized[:results][0][:user][:username])
    expect(image.credits[:artist_name]).to eq(symbolized[:results][0][:user][:name])
    expect(image.credits[:profile_url]).to eq(symbolized[:results][0][:user][:links][:html])
  end
end