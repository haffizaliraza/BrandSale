require "application_system_test_case"

class SitesTest < ApplicationSystemTestCase
  setup do
    @site = sites(:one)
  end

  test "visiting the index" do
    visit sites_url
    assert_selector "h1", text: "Sites"
  end

  test "should create site" do
    visit sites_url
    click_on "New site"

    fill_in "Brand name", with: @site.brand_name
    fill_in "Image", with: @site.image
    fill_in "New price", with: @site.new_price
    fill_in "Old price", with: @site.old_price
    fill_in "Product titile", with: @site.product_titile
    fill_in "Product url", with: @site.product_url
    fill_in "Products", with: @site.products
    fill_in "Url", with: @site.url
    click_on "Create Site"

    assert_text "Site was successfully created"
    click_on "Back"
  end

  test "should update Site" do
    visit site_url(@site)
    click_on "Edit this site", match: :first

    fill_in "Brand name", with: @site.brand_name
    fill_in "Image", with: @site.image
    fill_in "New price", with: @site.new_price
    fill_in "Old price", with: @site.old_price
    fill_in "Product titile", with: @site.product_titile
    fill_in "Product url", with: @site.product_url
    fill_in "Products", with: @site.products
    fill_in "Url", with: @site.url
    click_on "Update Site"

    assert_text "Site was successfully updated"
    click_on "Back"
  end

  test "should destroy Site" do
    visit site_url(@site)
    click_on "Destroy this site", match: :first

    assert_text "Site was successfully destroyed"
  end
end
