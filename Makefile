be-setup:
	bundle install
	rails db:drop
	rails db:create
	rails db:migrate
	rails db:seed

be-server:
	bundle exec rails server -p 3000

be-test:
	rspec
