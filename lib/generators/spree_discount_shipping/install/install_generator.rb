module SpreeDiscountShipping
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_discount_shipping'
      end

      def run_migrations
         response = ask 'Would you like to run the migrations now? [Y/n]'
         if response == '' || response.downcase == 'y'
           run 'bundle exec rake db:migrate'
         else
           puts 'Skiping rake db:migrate, don\'t forget to run it later!'
         end
      end
    end
  end
end
