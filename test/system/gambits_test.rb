require 'application_system_test_case'

class GambitsTest < ApplicationSystemTestCase
  setup do
    @gambit = gambits(:one)
  end

  test 'visiting the index' do
    visit gambits_url
    assert_selector 'h1', text: 'Gambits'
  end

  test 'creating a Gambit' do
    visit gambits_url
    click_on 'New Gambit'

    click_on 'Create Gambit'

    assert_text 'Gambit was successfully created'
    click_on 'Back'
  end

  test 'updating a Gambit' do
    visit gambits_url
    click_on 'Edit', match: :first

    click_on 'Update Gambit'

    assert_text 'Gambit was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Gambit' do
    visit gambits_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Gambit was successfully destroyed'
  end
end
