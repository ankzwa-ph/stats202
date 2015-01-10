# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task_stat do
    open 1
    in_progress 1
    resolved 1
    closed 1
    total 1
    processing_date "2015-01-11"
  end
end
