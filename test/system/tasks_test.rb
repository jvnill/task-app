require 'application_system_test_case'

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)

    visit tasks_path
    assert_selector 'h3', text: 'Tasks'

  end

  test 'Creating a new task' do
    click_on 'New Task'

    assert_selector '.task-form'

    fill_in 'task_title', with: 'Title'
    fill_in 'task_subtitle', with: 'Subtitle'

    click_on 'Save'

    assert_selector '.error-priority', text: 'can\'t be blank'

    select 'Low', from: 'task_priority'

    click_on 'Save'

    assert_no_selector '.task-form'
    assert_selector '.task-title h5', text: 'Title'
    assert_selector '.task-title div.text-secondary', text: 'Subtitle'
  end

  test 'Editing a task' do
    within "##{dom_id(@task)}" do
      click_link 'Edit'

      assert_selector '.task-form'

      fill_in 'task_title', with: 'New Title'
      fill_in 'task_subtitle', with: ''

      click_on 'Save'

      assert_selector '.error-subtitle', text: 'can\'t be blank'

      fill_in 'task_subtitle', with: 'Subtitulo'

      click_on 'Save'

      assert_no_selector '.task-form'
      assert_selector '.task-title h5', text: 'New Title'
      assert_selector '.task-title div.text-secondary', text: 'Subtitulo'
    end
  end

  test 'Deleting a task' do
    within "##{dom_id(@task)}" do
      click_button 'Destroy'
    end

    assert_no_selector "##{dom_id(@task)}"
  end

  test 'Marking job as finished' do
    within "##{dom_id(@task)}" do
      check 'task_finished'
    end

    assert_no_selector "##{dom_id(@task)}"
  end
end
