Given /^the following articles exist$/ do |table|
  # table is a Cucumber::Ast::Table
  Article.create table.hashes
end

Given /^the following comments exist$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |record|
    article = Article.find_by_title(record['article'])
    record.delete('article')
    comment = article.comments.create( record )
  end

end

Then /^the article "(.*?)" should have body "(.*?)"$/ do |title, body|
  Article.find_by_title(title).body.should eq body
end

Then /^the article "(.*?)" should have "(.*?)" comments$/ do |title, qtd_comments|
  Article.find_by_title(title).comments.count.should eq qtd_comments.to_i
end

Then /^the article "(.*?)" should be deleted$/ do |title|
  not Article.find_by_title(title)
end