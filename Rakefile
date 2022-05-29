# frozen_string_literal: true

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList[
   'test/card_test.rb',
   'test/**/*_test.rb',
   'poker_hand_evaluator_part_1_test.rb',
   'poker_hand_evaluator_part_1b_test.rb']
end

task default: :test
