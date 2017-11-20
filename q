[33mcommit c83483a28ffcf1e2be756e9ae12c9f1b64d126c7[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m, [m[1;31morigin/master[m[33m)[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Mon Nov 20 13:02:25 2017 +0000

    Creating a Stocks Table

[1mdiff --git a/app/views/stocks/index.html.erb b/app/views/stocks/index.html.erb[m
[1mindex 5c0913a..afc9162 100644[m
[1m--- a/app/views/stocks/index.html.erb[m
[1m+++ b/app/views/stocks/index.html.erb[m
[36m@@ -4,10 +4,11 @@[m
 <table class="table table-hover table-striped table-bordered">[m
   <thead>[m
     <tr>[m
[32m+[m[32m      <th>Company name</th>[m
       <th>Ticker</th>[m
       <th>Current Price</th>[m
       <th>Company Worth</th>[m
[31m-      <th colspan="3"></th>[m
[32m+[m[32m      <th colspan="1"></th>[m
     </tr>[m
   </thead>[m
 [m
[36m@@ -18,22 +19,20 @@[m
            <%  @stock_quote = StockQuote::Stock.quote(stock.ticker) %>[m
          <% rescue StandardError %>[m
            <tr>[m
[32m+[m[32m              <td><%= link_to "N/A", stock %></td>[m
               <td><%= stock.ticker %></td>[m
               <td><%= "N/A" %></td>[m
               <td><%= "N/A" %></td>[m
[31m-              <td><%= link_to 'Show', stock %></td>[m
[31m-              <td><%= link_to 'Edit', edit_stock_path(stock) %></td>[m
               <td><%= link_to 'Destroy', stock, method: :delete, data: { confirm: 'Are you sure?' } %></td>[m
             </tr>[m
           <% next %>[m
         <% end %>[m
         [m
         <tr>[m
[32m+[m[32m          <td><%= link_to @stock_quote.name, stock %></td>[m
           <td><%= stock.ticker %></td>[m
           <td><%= @stock_quote.l %></td>[m
           <td><%= @stock_quote.mc %></td>[m
[31m-          <td><center><%= link_to 'Show', stock, class: "btn btn-default btn-xs"%></center></td>[m
[31m-          <td><center><%= link_to 'Edit', edit_stock_path(stock), class: "btn btn-primary btn-xs" %></center></td>[m
           <td><center><%= link_to 'Destroy', stock, method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-danger btn-xs" %></center></td>[m
         </tr>[m
        <% end %> [m

[33mcommit a74c0601bcb88b283b5c9d91e6201d8ba868cb20[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Mon Nov 20 12:51:48 2017 +0000

    Styling Our Stock Views

[1mdiff --git a/app/views/stocks/index.html.erb b/app/views/stocks/index.html.erb[m
[1mindex 68c5ef4..5c0913a 100644[m
[1m--- a/app/views/stocks/index.html.erb[m
[1m+++ b/app/views/stocks/index.html.erb[m
[36m@@ -1,7 +1,7 @@[m
 [m
 <h1>Listing Stocks</h1>[m
 [m
[31m-<table>[m
[32m+[m[32m<table class="table table-hover table-striped table-bordered">[m
   <thead>[m
     <tr>[m
       <th>Ticker</th>[m
[36m@@ -16,7 +16,7 @@[m
       <% if stock.user_id == current_user.id %>[m
         <% begin %>[m
            <%  @stock_quote = StockQuote::Stock.quote(stock.ticker) %>[m
[31m-         <%  rescue StandardError %>[m
[32m+[m[32m         <% rescue StandardError %>[m
            <tr>[m
               <td><%= stock.ticker %></td>[m
               <td><%= "N/A" %></td>[m
[36m@@ -32,9 +32,9 @@[m
           <td><%= stock.ticker %></td>[m
           <td><%= @stock_quote.l %></td>[m
           <td><%= @stock_quote.mc %></td>[m
[31m-          <td><%= link_to 'Show', stock %></td>[m
[31m-          <td><%= link_to 'Edit', edit_stock_path(stock) %></td>[m
[31m-          <td><%= link_to 'Destroy', stock, method: :delete, data: { confirm: 'Are you sure?' } %></td>[m
[32m+[m[32m          <td><center><%= link_to 'Show', stock, class: "btn btn-default btn-xs"%></center></td>[m
[32m+[m[32m          <td><center><%= link_to 'Edit', edit_stock_path(stock), class: "btn btn-primary btn-xs" %></center></td>[m
[32m+[m[32m          <td><center><%= link_to 'Destroy', stock, method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-danger btn-xs" %></center></td>[m
         </tr>[m
        <% end %> [m
       <% end %>[m

[33mcommit aa67bc3eb86d4a1e452595067542831b4de17842[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Mon Nov 20 08:46:00 2017 +0000

    Stock Lookup Error Handling

[1mdiff --git a/app/views/stocks/index.html.erb b/app/views/stocks/index.html.erb[m
[1mindex 8877937..68c5ef4 100644[m
[1m--- a/app/views/stocks/index.html.erb[m
[1m+++ b/app/views/stocks/index.html.erb[m
[36m@@ -17,7 +17,14 @@[m
         <% begin %>[m
            <%  @stock_quote = StockQuote::Stock.quote(stock.ticker) %>[m
          <%  rescue StandardError %>[m
[31m-          [m
[32m+[m[32m           <tr>[m
[32m+[m[32m              <td><%= stock.ticker %></td>[m
[32m+[m[32m              <td><%= "N/A" %></td>[m
[32m+[m[32m              <td><%= "N/A" %></td>[m
[32m+[m[32m              <td><%= link_to 'Show', stock %></td>[m
[32m+[m[32m              <td><%= link_to 'Edit', edit_stock_path(stock) %></td>[m
[32m+[m[32m              <td><%= link_to 'Destroy', stock, method: :delete, data: { confirm: 'Are you sure?' } %></td>[m
[32m+[m[32m            </tr>[m
           <% next %>[m
         <% end %>[m
         [m

[33mcommit 09699675d53110f2c40a2182c85a6cb183c80cbe[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Mon Nov 20 08:45:03 2017 +0000

    Lookup Stock Information

[1mdiff --git a/app/views/stocks/index.html.erb b/app/views/stocks/index.html.erb[m
[1mindex 79da470..8877937 100644[m
[1m--- a/app/views/stocks/index.html.erb[m
[1m+++ b/app/views/stocks/index.html.erb[m
[36m@@ -5,21 +5,32 @@[m
   <thead>[m
     <tr>[m
       <th>Ticker</th>[m
[31m-      <th>User</th>[m
[32m+[m[32m      <th>Current Price</th>[m
[32m+[m[32m      <th>Company Worth</th>[m
       <th colspan="3"></th>[m
     </tr>[m
   </thead>[m
 [m
   <tbody>[m
     <% @stocks.each do |stock| %>[m
[31m-      <tr>[m
[31m-        <td><%= stock.ticker %></td>[m
[31m-        <td><%= stock.user_id %></td>[m
[31m-        <td><%= link_to 'Show', stock %></td>[m
[31m-        <td><%= link_to 'Edit', edit_stock_path(stock) %></td>[m
[31m-        <td><%= link_to 'Destroy', stock, method: :delete, data: { confirm: 'Are you sure?' } %></td>[m
[31m-      </tr>[m
[31m-    <% end %>[m
[32m+[m[32m      <% if stock.user_id == current_user.id %>[m
[32m+[m[32m        <% begin %>[m
[32m+[m[32m           <%  @stock_quote = StockQuote::Stock.quote(stock.ticker) %>[m
[32m+[m[32m         <%  rescue StandardError %>[m
[32m+[m[41m          [m
[32m+[m[32m          <% next %>[m
[32m+[m[32m        <% end %>[m
[32m+[m[41m        [m
[32m+[m[32m        <tr>[m
[32m+[m[32m          <td><%= stock.ticker %></td>[m
[32m+[m[32m          <td><%= @stock_quote.l %></td>[m
[32m+[m[32m          <td><%= @stock_quote.mc %></td>[m
[32m+[m[32m          <td><%= link_to 'Show', stock %></td>[m
[32m+[m[32m          <td><%= link_to 'Edit', edit_stock_path(stock) %></td>[m
[32m+[m[32m          <td><%= link_to 'Destroy', stock, method: :delete, data: { confirm: 'Are you sure?' } %></td>[m
[32m+[m[32m        </tr>[m
[32m+[m[32m       <% end %>[m[41m [m
[32m+[m[32m      <% end %>[m
   </tbody>[m
 </table>[m
 [m

[33mcommit 090f35ffa9dfdefffe5bf1e2085f99730641f80b[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Mon Nov 20 08:22:24 2017 +0000

    More Stock View Authentication

[1mdiff --git a/app/views/home/_navbar.html.erb b/app/views/home/_navbar.html.erb[m
[1mindex 58acdb5..59310c2 100644[m
[1m--- a/app/views/home/_navbar.html.erb[m
[1m+++ b/app/views/home/_navbar.html.erb[m
[36m@@ -21,8 +21,8 @@[m
         <li><%= link_to 'About Us', home_about_path %></li>[m
         [m
         <% if user_signed_in? %>[m
[31m-          <li><%= link_to 'Add stocks', stocks_path %></li>[m
[31m-          <li><%= link_to 'List stocks', new_stock_path %></li>[m
[32m+[m[32m          <li><%= link_to 'List stocks', stocks_path %></li>[m
[32m+[m[32m          <li><%= link_to 'Add stocks', new_stock_path %></li>[m
           <li><%= link_to 'Log Out', destroy_user_session_path, method: :delete %></li>[m
           <li><%= link_to 'Update Profile', edit_user_registration_path %></li>[m
         <% else %>[m
[1mdiff --git a/app/views/stocks/_form.html.erb b/app/views/stocks/_form.html.erb[m
[1mindex 2e6daee..f772e42 100644[m
[1m--- a/app/views/stocks/_form.html.erb[m
[1m+++ b/app/views/stocks/_form.html.erb[m
[36m@@ -16,8 +16,7 @@[m
     <%= f.text_field :ticker %>[m
   </div>[m
   <div class="field">[m
[31m-    <%= f.label :user_id %><br>[m
[31m-    <%= f.number_field :user_id %>[m
[32m+[m[32m    <%= f.text_field :user_id, value: current_user.id, type: :hidden %>[m
   </div>[m
   <div class="actions">[m
     <%= f.submit %>[m

[33mcommit 9e69970013b63b96e6a812e5f0f94f5d05a107f9[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Sun Nov 19 15:21:40 2017 +0000

    Authenticating Stock Views

[1mdiff --git a/app/controllers/stocks_controller.rb b/app/controllers/stocks_controller.rb[m
[1mindex 97ad09a..736c6a6 100644[m
[1m--- a/app/controllers/stocks_controller.rb[m
[1m+++ b/app/controllers/stocks_controller.rb[m
[36m@@ -1,5 +1,7 @@[m
 class StocksController < ApplicationController[m
   before_action :set_stock, only: [:show, :edit, :update, :destroy][m
[32m+[m[32m  before_action :correct_user, only: [:edit, :update, :destroy][m
[32m+[m[32m  before_action :authenticate_user![m
 [m
   # GET /stocks[m
   # GET /stocks.json[m
[36m@@ -71,4 +73,9 @@[m [mclass StocksController < ApplicationController[m
     def stock_params[m
       params.require(:stock).permit(:ticker, :user_id)[m
     end[m
[32m+[m[41m    [m
[32m+[m[32m    def correct_user[m
[32m+[m[32m      @ticker = current_user.stocks.find_by(id: params[:id])[m
[32m+[m[32m      redirect_to stocks_path, notice: "Not Authorized to edit this stock" if @ticker.nil?[m
[32m+[m[32m    end[m
 end[m

[33mcommit 53c055404f9ee681667c785b041635fbf862bd61[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Sun Nov 19 15:07:27 2017 +0000

    Creating Stock Links

[1mdiff --git a/app/views/home/_navbar.html.erb b/app/views/home/_navbar.html.erb[m
[1mindex c423868..58acdb5 100644[m
[1m--- a/app/views/home/_navbar.html.erb[m
[1m+++ b/app/views/home/_navbar.html.erb[m
[36m@@ -21,6 +21,8 @@[m
         <li><%= link_to 'About Us', home_about_path %></li>[m
         [m
         <% if user_signed_in? %>[m
[32m+[m[32m          <li><%= link_to 'Add stocks', stocks_path %></li>[m
[32m+[m[32m          <li><%= link_to 'List stocks', new_stock_path %></li>[m
           <li><%= link_to 'Log Out', destroy_user_session_path, method: :delete %></li>[m
           <li><%= link_to 'Update Profile', edit_user_registration_path %></li>[m
         <% else %>[m

[33mcommit 0be090e1de81676e1ec14b082cc45a31ea7fbf91[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Sun Nov 19 14:38:53 2017 +0000

    Associating Stocks with Users

[1mdiff --git a/app/models/stock.rb b/app/models/stock.rb[m
[1mindex f0a5bb0..64f50cf 100644[m
[1m--- a/app/models/stock.rb[m
[1m+++ b/app/models/stock.rb[m
[36m@@ -1,2 +1,3 @@[m
 class Stock < ActiveRecord::Base[m
[32m+[m[32m    belongs_to :user[m
 end[m
[1mdiff --git a/app/models/user.rb b/app/models/user.rb[m
[1mindex c822027..1b68ed7 100644[m
[1m--- a/app/models/user.rb[m
[1m+++ b/app/models/user.rb[m
[36m@@ -3,4 +3,5 @@[m [mclass User < ActiveRecord::Base[m
   # :confirmable, :lockable, :timeoutable and :omniauthable[m
   devise :database_authenticatable, :registerable,[m
          :recoverable, :rememberable, :trackable, :validatable[m
[32m+[m[32m         has_many :stocks[m
 end[m
[1mdiff --git a/app/views/stocks/index.html.erb b/app/views/stocks/index.html.erb[m
[1mindex e1fa909..79da470 100644[m
[1m--- a/app/views/stocks/index.html.erb[m
[1m+++ b/app/views/stocks/index.html.erb[m
[36m@@ -1,4 +1,3 @@[m
[31m-<p id="notice"><%= notice %></p>[m
 [m
 <h1>Listing Stocks</h1>[m
 [m
[1mdiff --git a/app/views/stocks/show.html.erb b/app/views/stocks/show.html.erb[m
[1mindex a077313..7300855 100644[m
[1m--- a/app/views/stocks/show.html.erb[m
[1m+++ b/app/views/stocks/show.html.erb[m
[36m@@ -1,4 +1,3 @@[m
[31m-<p id="notice"><%= notice %></p>[m
 [m
 <p>[m
   <strong>Ticker:</strong>[m

[33mcommit 12fa47c799dd384aae5909bb93ff13429f58f753[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Sun Nov 19 14:24:51 2017 +0000

    Creating a Stocks Scaffold

[1mdiff --git a/app/assets/javascripts/stocks.coffee b/app/assets/javascripts/stocks.coffee[m
[1mnew file mode 100644[m
[1mindex 0000000..24f83d1[m
[1m--- /dev/null[m
[1m+++ b/app/assets/javascripts/stocks.coffee[m
[36m@@ -0,0 +1,3 @@[m
[32m+[m[32m# Place all the behaviors and hooks related to the matching controller here.[m
[32m+[m[32m# All this logic will automatically be available in application.js.[m
[32m+[m[32m# You can use CoffeeScript in this file: http://coffeescript.org/[m
[1mdiff --git a/app/assets/stylesheets/scaffolds.scss b/app/assets/stylesheets/scaffolds.scss[m
[1mnew file mode 100644[m
[1mindex 0000000..ed7a765[m
[1m--- /dev/null[m
[1m+++ b/app/assets/stylesheets/scaffolds.scss[m
[36m@@ -0,0 +1,73 @@[m
[32m+[m[32mbody {[m
[32m+[m[32m  background-color: #fff;[m
[32m+[m[32m  color: #333;[m
[32m+[m[32m  font-family: verdana, arial, helvetica, sans-serif;[m
[32m+[m[32m  font-size: 13px;[m
[32m+[m[32m  line-height: 18px;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mp, ol, ul, td {[m
[32m+[m[32m  font-family: verdana, arial, helvetica, sans-serif;[m
[32m+[m[32m  font-size: 13px;[m
[32m+[m[32m  line-height: 18px;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mpre {[m
[32m+[m[32m  background-color: #eee;[m
[32m+[m[32m  padding: 10px;[m
[32m+[m[32m  font-size: 11px;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32ma {[m
[32m+[m[32m  color: #000;[m
[32m+[m
[32m+[m[32m  &:visited {[m
[32m+[m[32m    color: #666;[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  &:hover {[m
[32m+[m[32m    color: #fff;[m
[32m+[m[32m    background-color: #000;[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mdiv {[m
[32m+[m[32m  &.field, &.actions {[m
[32m+[m[32m    margin-bottom: 10px;[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m#notice {[m
[32m+[m[32m  color: green;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.field_with_errors {[m
[32m+[m[32m  padding: 2px;[m
[32m+[m[32m  background-color: red;[m
[32m+[m[32m  display: table;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m#error_explanation {[m
[32m+[m[32m  width: 450px;[m
[32m+[m[32m  border: 2px solid red;[m
[32m+[m[32m  padding: 7px;[m
[32m+[m[32m  padding-bottom: 0;[m
[32m+[m[32m  margin-bottom: 20px;[m
[32m+[m[32m  background-color: #f0f0f0;[m
[32m+[m
[32m+[m[32m  h2 {[m
[32m+[m[32m    text-align: left;[m
[32m+[m[32m    font-weight: bold;[m
[32m+[m[32m    padding: 5px 5px 5px 15px;[m
[32m+[m[32m    font-size: 12px;[m
[32m+[m[32m    margin: -7px;[m
[32m+[m[32m    margin-bottom: 0px;[m
[32m+[m[32m    background-color: #c00;[m
[32m+[m[32m    color: #fff;[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  ul li {[m
[32m+[m[32m    font-size: 12px;[m
[32m+[m[32m    list-style: square;[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
[1mdiff --git a/app/assets/stylesheets/stocks.scss b/app/assets/stylesheets/stocks.scss[m
[1mnew file mode 100644[m
[1mindex 0000000..c1bcb5a[m
[1m--- /dev/null[m
[1m+++ b/app/assets/stylesheets/stocks.scss[m
[36m@@ -0,0 +1,3 @@[m
[32m+[m[32m// Place all the styles related to the stocks controller here.[m
[32m+[m[32m// They will automatically be included in application.css.[m
[32m+[m[32m// You can use Sass (SCSS) here: http://sass-lang.com/[m
[1mdiff --git a/app/controllers/stocks_controller.rb b/app/controllers/stocks_controller.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..97ad09a[m
[1m--- /dev/null[m
[1m+++ b/app/controllers/stocks_controller.rb[m
[36m@@ -0,0 +1,74 @@[m
[32m+[m[32mclass StocksController < ApplicationController[m
[32m+[m[32m  before_action :set_stock, only: [:show, :edit, :update, :destroy][m
[32m+[m
[32m+[m[32m  # GET /stocks[m
[32m+[m[32m  # GET /stocks.json[m
[32m+[m[32m  def index[m
[32m+[m[32m    @stocks = Stock.all[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  # GET /stocks/1[m
[32m+[m[32m  # GET /stocks/1.json[m
[32m+[m[32m  def show[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  # GET /stocks/new[m
[32m+[m[32m  def new[m
[32m+[m[32m    @stock = Stock.new[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  # GET /stocks/1/edit[m
[32m+[m[32m  def edit[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  # POST /stocks[m
[32m+[m[32m  # POST /stocks.json[m
[32m+[m[32m  def create[m
[32m+[m[32m    @stock = Stock.new(stock_params)[m
[32m+[m
[32m+[m[32m    respond_to do |format|[m
[32m+[m[32m      if @stock.save[m
[32m+[m[32m        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }[m
[32m+[m[32m        format.json { render :show, status: :created, location: @stock }[m
[32m+[m[32m      else[m
[32m+[m[32m        format.html { render :new }[m
[32m+[m[32m        format.json { render json: @stock.errors, status: :unprocessable_entity }[m
[32m+[m[32m      end[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  # PATCH/PUT /stocks/1[m
[32m+[m[32m  # PATCH/PUT /stocks/1.json[m
[32m+[m[32m  def update[m
[32m+[m[32m    respond_to do |format|[m
[32m+[m[32m      if @stock.update(stock_params)[m
[32m+[m[32m        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }[m
[32m+[m[32m        format.json { render :show, status: :ok, location: @stock }[m
[32m+[m[32m      else[m
[32m+[m[32m        format.html { render :edit }[m
[32m+[m[32m        format.json { render json: @stock.errors, status: :unprocessable_entity }[m
[32m+[m[32m      end[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  # DELETE /stocks/1[m
[32m+[m[32m  # DELETE /stocks/1.json[m
[32m+[m[32m  def destroy[m
[32m+[m[32m    @stock.destroy[m
[32m+[m[32m    respond_to do |format|[m
[32m+[m[32m      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }[m
[32m+[m[32m      format.json { head :no_content }[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  private[m
[32m+[m[32m    # Use callbacks to share common setup or constraints between actions.[m
[32m+[m[32m    def set_stock[m
[32m+[m[32m      @stock = Stock.find(params[:id])[m
[32m+[m[32m    end[m
[32m+[m
[32m+[m[32m    # Never trust parameters from the scary internet, only allow the white list through.[m
[32m+[m[32m    def stock_params[m
[32m+[m[32m      params.require(:stock).permit(:ticker, :user_id)[m
[32m+[m[32m    end[m
[32m+[m[32mend[m
[1mdiff --git a/app/helpers/stocks_helper.rb b/app/helpers/stocks_helper.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..abe826f[m
[1m--- /dev/null[m
[1m+++ b/app/helpers/stocks_helper.rb[m
[36m@@ -0,0 +1,2 @@[m
[32m+[m[32mmodule StocksHelper[m
[32m+[m[32mend[m
[1mdiff --git a/app/models/stock.rb b/app/models/stock.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..f0a5bb0[m
[1m--- /dev/null[m
[1m+++ b/app/models/stock.rb[m
[36m@@ -0,0 +1,2 @@[m
[32m+[m[32mclass Stock < ActiveRecord::Base[m
[32m+[m[32mend[m
[1mdiff --git a/app/views/stocks/_form.html.erb b/app/views/stocks/_form.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..2e6daee[m
[1m--- /dev/null[m
[1m+++ b/app/views/stocks/_form.html.erb[m
[36m@@ -0,0 +1,25 @@[m
[32m+[m[32m<%= form_for(@stock) do |f| %>[m
[32m+[m[32m  <% if @stock.errors.any? %>[m
[32m+[m[32m    <div id="error_explanation">[m
[32m+[m[32m      <h2><%= pluralize(@stock.errors.count, "error") %> prohibited this stock from being saved:</h2>[m
[32m+[m
[32m+[m[32m      <ul>[m
[32m+[m[32m      <% @stock.errors.full_messages.each do |message| %>[m
[32m+[m[32m        <li><%= message %></li>[m
[32m+[m[32m      <% end %>[m
[32m+[m[32m      </ul>[m
[32m+[m[32m    </div>[m
[32m+[m[32m  <% end %>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :ticker %><br>[m
[32m+[m[32m    <%= f.text_field :ticker %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :user_id %><br>[m
[32m+[m[32m    <%= f.number_field :user_id %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m  <div class="actions">[m
[32m+[m[32m    <%= f.submit %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m<% end %>[m
[1mdiff --git a/app/views/stocks/_stock.json.jbuilder b/app/views/stocks/_stock.json.jbuilder[m
[1mnew file mode 100644[m
[1mindex 0000000..4aec1dd[m
[1m--- /dev/null[m
[1m+++ b/app/views/stocks/_stock.json.jbuilder[m
[36m@@ -0,0 +1,2 @@[m
[32m+[m[32mjson.extract! stock, :id, :ticker, :user_id, :created_at, :updated_at[m
[32m+[m[32mjson.url stock_url(stock, format: :json)[m
[1mdiff --git a/app/views/stocks/edit.html.erb b/app/views/stocks/edit.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..289f74e[m
[1m--- /dev/null[m
[1m+++ b/app/views/stocks/edit.html.erb[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m[32m<h1>Editing Stock</h1>[m
[32m+[m
[32m+[m[32m<%= render 'form' %>[m
[32m+[m
[32m+[m[32m<%= link_to 'Show', @stock %> |[m
[32m+[m[32m<%= link_to 'Back', stocks_path %>[m
[1mdiff --git a/app/views/stocks/index.html.erb b/app/views/stocks/index.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..e1fa909[m
[1m--- /dev/null[m
[1m+++ b/app/views/stocks/index.html.erb[m
[36m@@ -0,0 +1,29 @@[m
[32m+[m[32m<p id="notice"><%= notice %></p>[m
[32m+[m
[32m+[m[32m<h1>Listing Stocks</h1>[m
[32m+[m
[32m+[m[32m<table>[m
[32m+[m[32m  <thead>[m
[32m+[m[32m    <tr>[m
[32m+[m[32m      <th>Ticker</th>[m
[32m+[m[32m      <th>User</th>[m
[32m+[m[32m      <th colspan="3"></th>[m
[32m+[m[32m    </tr>[m
[32m+[m[32m  </thead>[m
[32m+[m
[32m+[m[32m  <tbody>[m
[32m+[m[32m    <% @stocks.each do |stock| %>[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td><%= stock.ticker %></td>[m
[32m+[m[32m        <td><%= stock.user_id %></td>[m
[32m+[m[32m        <td><%= link_to 'Show', stock %></td>[m
[32m+[m[32m        <td><%= link_to 'Edit', edit_stock_path(stock) %></td>[m
[32m+[m[32m        <td><%= link_to 'Destroy', stock, method: :delete, data: { confirm: 'Are you sure?' } %></td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    <% end %>[m
[32m+[m[32m  </tbody>[m
[32m+[m[32m</table>[m
[32m+[m
[32m+[m[32m<br>[m
[32m+[m
[32m+[m[32m<%= link_to 'New Stock', new_stock_path %>[m
[1mdiff --git a/app/views/stocks/index.json.jbuilder b/app/views/stocks/index.json.jbuilder[m
[1mnew file mode 100644[m
[1mindex 0000000..9c070c5[m
[1m--- /dev/null[m
[1m+++ b/app/views/stocks/index.json.jbuilder[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32mjson.array! @stocks, partial: 'stocks/stock', as: :stock[m
[1mdiff --git a/app/views/stocks/new.html.erb b/app/views/stocks/new.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..c877009[m
[1m--- /dev/null[m
[1m+++ b/app/views/stocks/new.html.erb[m
[36m@@ -0,0 +1,5 @@[m
[32m+[m[32m<h1>New Stock</h1>[m
[32m+[m
[32m+[m[32m<%= render 'form' %>[m
[32m+[m
[32m+[m[32m<%= link_to 'Back', stocks_path %>[m
[1mdiff --git a/app/views/stocks/show.html.erb b/app/views/stocks/show.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..a077313[m
[1m--- /dev/null[m
[1m+++ b/app/views/stocks/show.html.erb[m
[36m@@ -0,0 +1,14 @@[m
[32m+[m[32m<p id="notice"><%= notice %></p>[m
[32m+[m
[32m+[m[32m<p>[m
[32m+[m[32m  <strong>Ticker:</strong>[m
[32m+[m[32m  <%= @stock.ticker %>[m
[32m+[m[32m</p>[m
[32m+[m
[32m+[m[32m<p>[m
[32m+[m[32m  <strong>User:</strong>[m
[32m+[m[32m  <%= @stock.user_id %>[m
[32m+[m[32m</p>[m
[32m+[m
[32m+[m[32m<%= link_to 'Edit', edit_stock_path(@stock) %> |[m
[32m+[m[32m<%= link_to 'Back', stocks_path %>[m
[1mdiff --git a/app/views/stocks/show.json.jbuilder b/app/views/stocks/show.json.jbuilder[m
[1mnew file mode 100644[m
[1mindex 0000000..0d1172d[m
[1m--- /dev/null[m
[1m+++ b/app/views/stocks/show.json.jbuilder[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32mjson.partial! "stocks/stock", stock: @stock[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex e2a50a1..4107102 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -1,4 +1,5 @@[m
 Rails.application.routes.draw do[m
[32m+[m[32m  resources :stocks[m
   devise_for :users[m
  # get 'home/index'[m
   root 'home#index'[m
[1mdiff --git a/db/migrate/20171119141959_create_stocks.rb b/db/migrate/20171119141959_create_stocks.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..968b2fa[m
[1m--- /dev/null[m
[1m+++ b/db/migrate/20171119141959_create_stocks.rb[m
[36m@@ -0,0 +1,11 @@[m
[32m+[m[32mclass CreateStocks < ActiveRecord::Migration[m
[32m+[m[32m  def change[m
[32m+[m[32m    create_table :stocks do |t|[m
[32m+[m[32m      t.string :ticker[m
[32m+[m[32m      t.integer :user_id[m
[32m+[m
[32m+[m[32m      t.timestamps null: false[m
[32m+[m[32m    end[m
[32m+[m[32m    add_index :stocks, :user_id[m
[32m+[m[32m  end[m
[32m+[m[32mend[m
[1mdiff --git a/db/schema.rb b/db/schema.rb[m
[1mindex b41b62e..dfdae51 100644[m
[1m--- a/db/schema.rb[m
[1m+++ b/db/schema.rb[m
[36m@@ -11,7 +11,16 @@[m
 #[m
 # It's strongly recommended that you check this file into your version control system.[m
 [m
[31m-ActiveRecord::Schema.define(version: 20171118050619) do[m
[32m+[m[32mActiveRecord::Schema.define(version: 20171119141959) do[m
[32m+[m
[32m+[m[32m  create_table "stocks", force: :cascade do |t|[m
[32m+[m[32m    t.string   "ticker"[m
[32m+[m[32m    t.integer  "user_id"[m
[32m+[m[32m    t.datetime "created_at", null: false[m
[32m+[m[32m    t.datetime "updated_at", null: false[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  add_index "stocks", ["user_id"], name: "index_stocks_on_user_id"[m
 [m
   create_table "users", force: :cascade do |t|[m
     t.string   "email",                  default: "", null: false[m
[1mdiff --git a/test/controllers/stocks_controller_test.rb b/test/controllers/stocks_controller_test.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..21c1c60[m
[1m--- /dev/null[m
[1m+++ b/test/controllers/stocks_controller_test.rb[m
[36m@@ -0,0 +1,49 @@[m
[32m+[m[32mrequire 'test_helper'[m
[32m+[m
[32m+[m[32mclass StocksControllerTest < ActionController::TestCase[m
[32m+[m[32m  setup do[m
[32m+[m[32m    @stock = stocks(:one)[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  test "should get index" do[m
[32m+[m[32m    get :index[m
[32m+[m[32m    assert_response :success[m
[32m+[m[32m    assert_not_nil assigns(:stocks)[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  test "should get new" do[m
[32m+[m[32m    get :new[m
[32m+[m[32m    assert_response :success[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  test "should create stock" do[m
[32m+[m[32m    assert_difference('Stock.count') do[m
[32m+[m[32m      post :create, stock: { ticker: @stock.ticker, user_id: @stock.user_id }[m
[32m+[m[32m    end[m
[32m+[m
[32m+[m[32m    assert_redirected_to stock_path(assigns(:stock))[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  test "should show stock" do[m
[32m+[m[32m    get :show, id: @stock[m
[32m+[m[32m    assert_response :success[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  test "should get edit" do[m
[32m+[m[32m    get :edit, id: @stock[m
[32m+[m[32m    assert_response :success[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  test "should update stock" do[m
[32m+[m[32m    patch :update, id: @stock, stock: { ticker: @stock.ticker, user_id: @stock.user_id }[m
[32m+[m[32m    assert_redirected_to stock_path(assigns(:stock))[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  test "should destroy stock" do[m
[32m+[m[32m    assert_difference('Stock.count', -1) do[m
[32m+[m[32m      delete :destroy, id: @stock[m
[32m+[m[32m    end[m
[32m+[m
[32m+[m[32m    assert_redirected_to stocks_path[m
[32m+[m[32m  end[m
[32m+[m[32mend[m
[1mdiff --git a/test/fixtures/stocks.yml b/test/fixtures/stocks.yml[m
[1mnew file mode 100644[m
[1mindex 0000000..baea554[m
[1m--- /dev/null[m
[1m+++ b/test/fixtures/stocks.yml[m
[36m@@ -0,0 +1,9 @@[m
[32m+[m[32m# Read about fixtures at http://api.rubyonrails.org/classes/ActiveRecord/FixtureSet.html[m
[32m+[m
[32m+[m[32mone:[m
[32m+[m[32m  ticker: MyString[m
[32m+[m[32m  user_id: 1[m
[32m+[m
[32m+[m[32mtwo:[m
[32m+[m[32m  ticker: MyString[m
[32m+[m[32m  user_id: 1[m
[1mdiff --git a/test/models/stock_test.rb b/test/models/stock_test.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..a6bcb87[m
[1m--- /dev/null[m
[1m+++ b/test/models/stock_test.rb[m
[36m@@ -0,0 +1,7 @@[m
[32m+[m[32mrequire 'test_helper'[m
[32m+[m
[32m+[m[32mclass StockTest < ActiveSupport::TestCase[m
[32m+[m[32m  # test "the truth" do[m
[32m+[m[32m  #   assert true[m
[32m+[m[32m  # end[m
[32m+[m[32mend[m

[33mcommit abb32d41fa746d2600280d789a1feebbe846d2c4[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Sat Nov 18 08:58:47 2017 +0000

    Styling Update Profile page

[1mdiff --git a/app/views/devise/registrations/edit.html.erb b/app/views/devise/registrations/edit.html.erb[m
[1mindex 1e66f3d..49b62dc 100644[m
[1m--- a/app/views/devise/registrations/edit.html.erb[m
[1m+++ b/app/views/devise/registrations/edit.html.erb[m
[36m@@ -1,43 +1,65 @@[m
[31m-<h2>Edit <%= resource_name.to_s.humanize %></h2>[m
 [m
[31m-<%= form_for(resource, as: resource_name, url: registration_path(resource_name), html: { method: :put }) do |f| %>[m
[31m-  <%= devise_error_messages! %>[m
[31m-[m
[31m-  <div class="field">[m
[31m-    <%= f.label :email %><br />[m
[31m-    <%= f.email_field :email, autofocus: true %>[m
[32m+[m[32m<div class="panel panel-default">[m
[32m+[m[32m  <div class="panel-heading">[m
[32m+[m[32m    <h3 class="panel-title">Edit <%= resource_name.to_s.humanize %></h3>[m
   </div>[m
[31m-[m
[31m-  <% if devise_mapping.confirmable? && resource.pending_reconfirmation? %>[m
[31m-    <div>Currently waiting confirmation for: <%= resource.unconfirmed_email %></div>[m
[31m-  <% end %>[m
[31m-[m
[31m-  <div class="field">[m
[31m-    <%= f.label :password %> <i>(leave blank if you don't want to change it)</i><br />[m
[31m-    <%= f.password_field :password, autocomplete: "off" %>[m
[31m-    <% if @minimum_password_length %>[m
[31m-      <br />[m
[31m-      <em><%= @minimum_password_length %> characters minimum</em>[m
[32m+[m[32m  <div class="panel-body">[m
[32m+[m[32m        <%= form_for(resource, as: resource_name, url: registration_path(resource_name), html: { method: :put }) do |f| %>[m
[32m+[m[32m      <%= devise_error_messages! %>[m
[32m+[m[41m    [m
[32m+[m[32m      <div class="form-group">[m
[32m+[m[32m        <%= f.label :email %><br />[m
[32m+[m[32m        <%= f.email_field :email, autofocus: true, class: "form-control" %>[m
[32m+[m[32m      </div>[m
[32m+[m[41m    [m
[32m+[m[32m      <% if devise_mapping.confirmable? && resource.pending_reconfirmation? %>[m
[32m+[m[32m        <div>Currently waiting confirmation for: <%= resource.unconfirmed_email %></div>[m
[32m+[m[32m      <% end %>[m
[32m+[m[41m    [m
[32m+[m[32m      <div class="form-group">[m
[32m+[m[32m        <%= f.label :password %> <i>(leave blank if you don't want to change it)</i><br />[m
[32m+[m[32m        <%= f.password_field :password, autocomplete: "off", class: "form-control" %>[m
[32m+[m[32m        <% if @minimum_password_length %>[m
[32m+[m[32m          <br />[m
[32m+[m[32m          <em><%= @minimum_password_length %> characters minimum</em>[m
[32m+[m[32m        <% end %>[m
[32m+[m[32m      </div>[m
[32m+[m[41m    [m
[32m+[m[32m      <div class="form-group">[m
[32m+[m[32m        <%= f.label :password_confirmation %><br />[m
[32m+[m[32m        <%= f.password_field :password_confirmation, autocomplete: "off", class: "form-control" %>[m
[32m+[m[32m      </div>[m
[32m+[m[41m    [m
[32m+[m[32m      <div class="form-group">[m
[32m+[m[32m        <%= f.label :current_password %> <i>(we need your current password to confirm your changes)</i><br />[m
[32m+[m[32m        <%= f.password_field :current_password, autocomplete: "off", class: "form-control" %>[m
[32m+[m[32m      </div>[m
[32m+[m[41m    [m
[32m+[m[32m      <div class="actions">[m
[32m+[m[32m        <%= f.submit "Update", class: "btn btn-primary" %>[m
[32m+[m[32m      </div>[m
     <% end %>[m
   </div>[m
[31m-[m
[31m-  <div class="field">[m
[31m-    <%= f.label :password_confirmation %><br />[m
[31m-    <%= f.password_field :password_confirmation, autocomplete: "off" %>[m
[32m+[m[32m  <div class="panel-footer">[m
[32m+[m[32m    <%= link_to "Back", :back %>[m
   </div>[m
[32m+[m[32m</div>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :current_password %> <i>(we need your current password to confirm your changes)</i><br />[m
[31m-    <%= f.password_field :current_password, autocomplete: "off" %>[m
[32m+[m[32m<div class="panel panel-default">[m
[32m+[m[32m  <div class="panel-heading">[m
[32m+[m[32m    <h3 class="panel-title">Cancel mu account</h3>[m
   </div>[m
[31m-[m
[31m-  <div class="actions">[m
[31m-    <%= f.submit "Update" %>[m
[32m+[m[32m  <div class="panel-body">[m
[32m+[m[32m    <p>Unhappy? <%= button_to "Cancel my account", registration_path(resource_name), data: { confirm: "Are you sure?" }, method: :delete, class: "btn btn-danger" %></p>[m
   </div>[m
[31m-<% end %>[m
[32m+[m[32m  <div class="panel-footer">[m
[32m+[m[32m    <%= link_to "Back", :back %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m</div>[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
 [m
[31m-<h3>Cancel my account</h3>[m
 [m
[31m-<p>Unhappy? <%= button_to "Cancel my account", registration_path(resource_name), data: { confirm: "Are you sure?" }, method: :delete %></p>[m
 [m
[31m-<%= link_to "Back", :back %>[m

[33mcommit fde7eff3616440615517316d9e6c565b29c39167[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Sat Nov 18 08:50:35 2017 +0000

    Styling Sign up page

[1mdiff --git a/app/views/devise/registrations/new.html.erb b/app/views/devise/registrations/new.html.erb[m
[1mindex 5a238ce..38170c0 100644[m
[1m--- a/app/views/devise/registrations/new.html.erb[m
[1m+++ b/app/views/devise/registrations/new.html.erb[m
[36m@@ -1,29 +1,44 @@[m
[31m-<h2>Sign up</h2>[m
 [m
[31m-<%= form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>[m
[32m+[m[32m<div class="panel panel-default">[m
[32m+[m[32m  <div class="panel-heading">[m
[32m+[m[32m    <h3 class="panel-title">Sign up</h3>[m
[32m+[m[32m  </div>[m
[32m+[m[32m  <div class="panel-body">[m
[32m+[m[32m    <%= form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>[m
   <%= devise_error_messages! %>[m
 [m
[31m-  <div class="field">[m
[32m+[m[32m  <div class="form-group">[m
     <%= f.label :email %><br />[m
[31m-    <%= f.email_field :email, autofocus: true %>[m
[32m+[m[32m    <%= f.email_field :email, autofocus: true, class: "form-control" %>[m
   </div>[m
 [m
[31m-  <div class="field">[m
[32m+[m[32m  <div class="form-group">[m
     <%= f.label :password %>[m
     <% if @minimum_password_length %>[m
     <em>(<%= @minimum_password_length %> characters minimum)</em>[m
     <% end %><br />[m
[31m-    <%= f.password_field :password, autocomplete: "off" %>[m
[32m+[m[32m    <%= f.password_field :password, autocomplete: "off", class: "form-control" %>[m
   </div>[m
 [m
[31m-  <div class="field">[m
[32m+[m[32m  <div class="form-group">[m
     <%= f.label :password_confirmation %><br />[m
[31m-    <%= f.password_field :password_confirmation, autocomplete: "off" %>[m
[32m+[m[32m    <%= f.password_field :password_confirmation, autocomplete: "off", class: "form-control" %>[m
   </div>[m
 [m
   <div class="actions">[m
[31m-    <%= f.submit "Sign up" %>[m
[32m+[m[32m    <%= f.submit "Sign up", class: "btn btn-primary" %>[m
   </div>[m
 <% end %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m  <div class="panel-footer">[m
[32m+[m[32m    <%= render "devise/shared/links" %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m</div>[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
 [m
[31m-<%= render "devise/shared/links" %>[m

[33mcommit 145d1747c7692132ed4f861d2effea4e7c3793df[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Sat Nov 18 08:44:49 2017 +0000

    Styling Log in page

[1mdiff --git a/app/views/devise/sessions/new.html.erb b/app/views/devise/sessions/new.html.erb[m
[1mindex b261cfd..03d973b 100644[m
[1m--- a/app/views/devise/sessions/new.html.erb[m
[1m+++ b/app/views/devise/sessions/new.html.erb[m
[36m@@ -1,26 +1,41 @@[m
[31m-<h2>Log in</h2>[m
 [m
[31m-<%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :email %><br />[m
[31m-    <%= f.email_field :email, autofocus: true %>[m
[31m-  </div>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :password %><br />[m
[31m-    <%= f.password_field :password, autocomplete: "off" %>[m
[32m+[m[32m<div class="panel panel-default">[m
[32m+[m[32m  <div class="panel-heading">[m
[32m+[m[32m    <h3 class="panel-title">Log in</h3>[m
[32m+[m[32m  </div>[m
[32m+[m[32m  <div class="panel-body">[m
[32m+[m[32m        <%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>[m
[32m+[m[32m      <div class="form-group">[m
[32m+[m[32m        <%= f.label :email %><br />[m
[32m+[m[32m        <%= f.email_field :email, autofocus: true, class: "form-control" %>[m
[32m+[m[32m      </div>[m
[32m+[m[41m    [m
[32m+[m[32m      <div class="form-group">[m
[32m+[m[32m        <%= f.label :password %><br />[m
[32m+[m[32m        <%= f.password_field :password, autocomplete: "off", class: "form-control" %>[m
[32m+[m[32m      </div>[m
[32m+[m[41m    [m
[32m+[m[32m      <% if devise_mapping.rememberable? -%>[m
[32m+[m[32m        <div class="form-group">[m
[32m+[m[32m          <%= f.check_box :remember_me %>[m
[32m+[m[32m          <%= f.label :remember_me %>[m
[32m+[m[32m        </div>[m
[32m+[m[32m      <% end -%>[m
[32m+[m[41m    [m
[32m+[m[32m      <div class="actions">[m
[32m+[m[32m        <%= f.submit "Log in", class: "btn btn-primary" %>[m
[32m+[m[32m      </div>[m
[32m+[m[32m    <% end %>[m
   </div>[m
[32m+[m[32m  <div class="panel-footer">[m
[32m+[m[32m    <%= render "devise/shared/links" %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m</div>[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
 [m
[31m-  <% if devise_mapping.rememberable? -%>[m
[31m-    <div class="field">[m
[31m-      <%= f.check_box :remember_me %>[m
[31m-      <%= f.label :remember_me %>[m
[31m-    </div>[m
[31m-  <% end -%>[m
 [m
[31m-  <div class="actions">[m
[31m-    <%= f.submit "Log in" %>[m
[31m-  </div>[m
[31m-<% end %>[m
 [m
[31m-<%= render "devise/shared/links" %>[m

[33mcommit ca54dc5ae95f8bd2e19901b87421c4c489ea014c[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Sat Nov 18 06:49:33 2017 +0000

    Devise Menu Link Conditionals

[1mdiff --git a/app/views/home/_navbar.html.erb b/app/views/home/_navbar.html.erb[m
[1mindex 4ae333a..c423868 100644[m
[1m--- a/app/views/home/_navbar.html.erb[m
[1m+++ b/app/views/home/_navbar.html.erb[m
[36m@@ -16,8 +16,18 @@[m
           [m
       </ul>[m
       <ul class="nav navbar-nav navbar-right">[m
[32m+[m[41m        [m
         <li><%= link_to 'Home', root_path %></li>[m
         <li><%= link_to 'About Us', home_about_path %></li>[m
[32m+[m[41m        [m
[32m+[m[32m        <% if user_signed_in? %>[m
[32m+[m[32m          <li><%= link_to 'Log Out', destroy_user_session_path, method: :delete %></li>[m
[32m+[m[32m          <li><%= link_to 'Update Profile', edit_user_registration_path %></li>[m
[32m+[m[32m        <% else %>[m
[32m+[m[32m          <li><%= link_to 'Sign up', new_user_registration_path %></li>[m
[32m+[m[32m          <li><%= link_to 'Log In', new_user_session_path %></li>[m
[32m+[m[32m        <% end %>[m
[32m+[m
       </ul>[m
     </div><!-- /.navbar-collapse -->[m
   </div><!-- /.container-fluid -->[m

[33mcommit 352356d45caa03ee2812cad1576a975de13d3b01[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Sat Nov 18 05:21:48 2017 +0000

    Fix the Flash Message

[1mdiff --git a/app/views/home/_flash.html.erb b/app/views/home/_flash.html.erb[m
[1mindex b8702fe..f5f3d48 100644[m
[1m--- a/app/views/home/_flash.html.erb[m
[1m+++ b/app/views/home/_flash.html.erb[m
[36m@@ -3,6 +3,6 @@[m
         <button class="close" data-dismiss="alert">[m
             <i class="glyphicon glyphicon-remove-circle"></i>[m
         </button>[m
[31m-        <% content_tag(:dib, msg) %>[m
[32m+[m[32m        <%= content_tag(:dib, msg) %>[m
     </div>[m
 <% end %>[m
\ No newline at end of file[m

[33mcommit 0b03d899f83e04a6c2d7915b96849742d46369cd[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Sat Nov 18 05:14:06 2017 +0000

    Devise Database Rake DB:Migrate

[1mdiff --git a/app/models/user.rb b/app/models/user.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..c822027[m
[1m--- /dev/null[m
[1m+++ b/app/models/user.rb[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m[32mclass User < ActiveRecord::Base[m
[32m+[m[32m  # Include default devise modules. Others available are:[m
[32m+[m[32m  # :confirmable, :lockable, :timeoutable and :omniauthable[m
[32m+[m[32m  devise :database_authenticatable, :registerable,[m
[32m+[m[32m         :recoverable, :rememberable, :trackable, :validatable[m
[32m+[m[32mend[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex 4b54732..e2a50a1 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -1,4 +1,5 @@[m
 Rails.application.routes.draw do[m
[32m+[m[32m  devise_for :users[m
  # get 'home/index'[m
   root 'home#index'[m
   get 'home/about'[m
[1mdiff --git a/db/migrate/20171118050619_devise_create_users.rb b/db/migrate/20171118050619_devise_create_users.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..9200e8b[m
[1m--- /dev/null[m
[1m+++ b/db/migrate/20171118050619_devise_create_users.rb[m
[36m@@ -0,0 +1,42 @@[m
[32m+[m[32mclass DeviseCreateUsers < ActiveRecord::Migration[m
[32m+[m[32m  def change[m
[32m+[m[32m    create_table :users do |t|[m
[32m+[m[32m      ## Database authenticatable[m
[32m+[m[32m      t.string :email,              null: false, default: ""[m
[32m+[m[32m      t.string :encrypted_password, null: false, default: ""[m
[32m+[m
[32m+[m[32m      ## Recoverable[m
[32m+[m[32m      t.string   :reset_password_token[m
[32m+[m[32m      t.datetime :reset_password_sent_at[m
[32m+[m
[32m+[m[32m      ## Rememberable[m
[32m+[m[32m      t.datetime :remember_created_at[m
[32m+[m
[32m+[m[32m      ## Trackable[m
[32m+[m[32m      t.integer  :sign_in_count, default: 0, null: false[m
[32m+[m[32m      t.datetime :current_sign_in_at[m
[32m+[m[32m      t.datetime :last_sign_in_at[m
[32m+[m[32m      t.string   :current_sign_in_ip[m
[32m+[m[32m      t.string   :last_sign_in_ip[m
[32m+[m
[32m+[m[32m      ## Confirmable[m
[32m+[m[32m      # t.string   :confirmation_token[m
[32m+[m[32m      # t.datetime :confirmed_at[m
[32m+[m[32m      # t.datetime :confirmation_sent_at[m
[32m+[m[32m      # t.string   :unconfirmed_email # Only if using reconfirmable[m
[32m+[m
[32m+[m[32m      ## Lockable[m
[32m+[m[32m      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts[m
[32m+[m[32m      # t.string   :unlock_token # Only if unlock strategy is :email or :both[m
[32m+[m[32m      # t.datetime :locked_at[m
[32m+[m
[32m+[m
[32m+[m[32m      t.timestamps null: false[m
[32m+[m[32m    end[m
[32m+[m
[32m+[m[32m    add_index :users, :email,                unique: true[m
[32m+[m[32m    add_index :users, :reset_password_token, unique: true[m
[32m+[m[32m    # add_index :users, :confirmation_token,   unique: true[m
[32m+[m[32m    # add_index :users, :unlock_token,         unique: true[m
[32m+[m[32m  end[m
[32m+[m[32mend[m
[1mdiff --git a/db/schema.rb b/db/schema.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..b41b62e[m
[1m--- /dev/null[m
[1m+++ b/db/schema.rb[m
[36m@@ -0,0 +1,34 @@[m
[32m+[m[32m# encoding: UTF-8[m
[32m+[m[32m# This file is auto-generated from the current state of the database. Instead[m
[32m+[m[32m# of editing this file, please use the migrations feature of Active Record to[m
[32m+[m[32m# incrementally modify your database, and then regenerate this schema definition.[m
[32m+[m[32m#[m
[32m+[m[32m# Note that this schema.rb definition is the authoritative source for your[m
[32m+[m[32m# database schema. If you need to create the application database on another[m
[32m+[m[32m# system, you should be using db:schema:load, not running all the migrations[m
[32m+[m[32m# from scratch. The latter is a flawed and unsustainable approach (the more migrations[m
[32m+[m[32m# you'll amass, the slower it'll run and the greater likelihood for issues).[m
[32m+[m[32m#[m
[32m+[m[32m# It's strongly recommended that you check this file into your version control system.[m
[32m+[m
[32m+[m[32mActiveRecord::Schema.define(version: 20171118050619) do[m
[32m+[m
[32m+[m[32m  create_table "users", force: :cascade do |t|[m
[32m+[m[32m    t.string   "email",                  default: "", null: false[m
[32m+[m[32m    t.string   "encrypted_password",     default: "", null: false[m
[32m+[m[32m    t.string   "reset_password_token"[m
[32m+[m[32m    t.datetime "reset_password_sent_at"[m
[32m+[m[32m    t.datetime "remember_created_at"[m
[32m+[m[32m    t.integer  "sign_in_count",          default: 0,  null: false[m
[32m+[m[32m    t.datetime "current_sign_in_at"[m
[32m+[m[32m    t.datetime "last_sign_in_at"[m
[32m+[m[32m    t.string   "current_sign_in_ip"[m
[32m+[m[32m    t.string   "last_sign_in_ip"[m
[32m+[m[32m    t.datetime "created_at",                          null: false[m
[32m+[m[32m    t.datetime "updated_at",                          null: false[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  add_index "users", ["email"], name: "index_users_on_email", unique: true[m
[32m+[m[32m  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true[m
[32m+[m
[32m+[m[32mend[m
[1mdiff --git a/test/fixtures/users.yml b/test/fixtures/users.yml[m
[1mnew file mode 100644[m
[1mindex 0000000..937a0c0[m
[1m--- /dev/null[m
[1m+++ b/test/fixtures/users.yml[m
[36m@@ -0,0 +1,11 @@[m
[32m+[m[32m# Read about fixtures at http://api.rubyonrails.org/classes/ActiveRecord/FixtureSet.html[m
[32m+[m
[32m+[m[32m# This model initially had no columns defined.  If you add columns to the[m
[32m+[m[32m# model remove the '{}' from the fixture names and add the columns immediately[m
[32m+[m[32m# below each fixture, per the syntax in the comments below[m
[32m+[m[32m#[m
[32m+[m[32mone: {}[m
[32m+[m[32m# column: value[m
[32m+[m[32m#[m
[32m+[m[32mtwo: {}[m
[32m+[m[32m#  column: value[m
[1mdiff --git a/test/models/user_test.rb b/test/models/user_test.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..82f61e0[m
[1m--- /dev/null[m
[1m+++ b/test/models/user_test.rb[m
[36m@@ -0,0 +1,7 @@[m
[32m+[m[32mrequire 'test_helper'[m
[32m+[m
[32m+[m[32mclass UserTest < ActiveSupport::TestCase[m
[32m+[m[32m  # test "the truth" do[m
[32m+[m[32m  #   assert true[m
[32m+[m[32m  # end[m
[32m+[m[32mend[m

[33mcommit 870b145c27b937759421afccc7643a4fb2c03b95[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Sat Nov 18 05:03:38 2017 +0000

    Setting Up Devise Flash Message Partials

[1mdiff --git a/app/views/home/_flash.html.erb b/app/views/home/_flash.html.erb[m
[1mindex e69de29..b8702fe 100644[m
[1m--- a/app/views/home/_flash.html.erb[m
[1m+++ b/app/views/home/_flash.html.erb[m
[36m@@ -0,0 +1,8 @@[m
[32m+[m[32m<% flash.each do |name, msg| %>[m
[32m+[m[32m    <div class="alert alert-warning alert-dismissible">[m
[32m+[m[32m        <button class="close" data-dismiss="alert">[m
[32m+[m[32m            <i class="glyphicon glyphicon-remove-circle"></i>[m
[32m+[m[32m        </button>[m
[32m+[m[32m        <% content_tag(:dib, msg) %>[m
[32m+[m[32m    </div>[m
[32m+[m[32m<% end %>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb[m
[1mindex 46db065..4e9d5a5 100644[m
[1m--- a/app/views/layouts/application.html.erb[m
[1m+++ b/app/views/layouts/application.html.erb[m
[36m@@ -10,8 +10,7 @@[m
   <%= render 'home/navbar' %>[m
 [m
 <div class="container">[m
[31m-  <p class="notice"><%= notice %></p>[m
[31m-  <p class="alert"><%= alert %></p>[m
[32m+[m[32m  <%= render 'home/flash' %>[m
  <%= yield %>[m
 </div>[m
 [m

[33mcommit 4f9d492c079eed0e47f0ce6a9695e6a4795a5639[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Sat Nov 18 04:57:29 2017 +0000

    Installing the Devise Gem

[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex e1fb2f4..5309eb5 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -11,6 +11,8 @@[m [mgem 'jbuilder', '~> 2.0'[m
 gem 'sdoc', '~> 0.4.0', group: :doc[m
 gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'[m
 gem 'stock_quote', '~> 1.5', '>= 1.5.2'[m
[32m+[m[32mgem 'devise', '~> 4.3'[m
[32m+[m
 [m
 group :development, :test do[m
   gem 'byebug'[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex 25cde2f..332e57c 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -39,6 +39,7 @@[m [mGEM[m
     arel (6.0.4)[m
     autoprefixer-rails (7.1.6)[m
       execjs[m
[32m+[m[32m    bcrypt (3.1.11)[m
     binding_of_caller (0.7.2)[m
       debug_inspector (>= 0.0.1)[m
     bootstrap-sass (3.3.7)[m
[36m@@ -55,6 +56,12 @@[m [mGEM[m
     coffee-script-source (1.12.2)[m
     concurrent-ruby (1.0.5)[m
     debug_inspector (0.0.3)[m
[32m+[m[32m    devise (4.3.0)[m
[32m+[m[32m      bcrypt (~> 3.0)[m
[32m+[m[32m      orm_adapter (~> 0.1)[m
[32m+[m[32m      railties (>= 4.1.0, < 5.2)[m
[32m+[m[32m      responders[m
[32m+[m[32m      warden (~> 1.2.3)[m
     domain_name (0.5.20170404)[m
       unf (>= 0.0.5, < 1.0.0)[m
     erubis (2.7.0)[m
[36m@@ -86,6 +93,7 @@[m [mGEM[m
     netrc (0.11.0)[m
     nokogiri (1.8.0)[m
       mini_portile2 (~> 2.2.0)[m
[32m+[m[32m    orm_adapter (0.5.0)[m
     rack (1.6.8)[m
     rack-test (0.6.3)[m
       rack (>= 1.0)[m
[36m@@ -118,6 +126,9 @@[m [mGEM[m
     rb-inotify (0.9.10)[m
       ffi (>= 0.5.0, < 2)[m
     rdoc (4.3.0)[m
[32m+[m[32m    responders (2.4.0)[m
[32m+[m[32m      actionpack (>= 4.2.0, < 5.3)[m
[32m+[m[32m      railties (>= 4.2.0, < 5.3)[m
     rest-client (2.0.2)[m
       http-cookie (>= 1.0.2, < 2.0)[m
       mime-types (>= 1.16, < 4.0)[m
[36m@@ -162,6 +173,8 @@[m [mGEM[m
     unf (0.1.4)[m
       unf_ext[m
     unf_ext (0.0.7.4)[m
[32m+[m[32m    warden (1.2.7)[m
[32m+[m[32m      rack (>= 1.0)[m
     web-console (2.3.0)[m
       activemodel (>= 4.0)[m
       binding_of_caller (>= 0.7.2)[m
[36m@@ -175,6 +188,7 @@[m [mDEPENDENCIES[m
   bootstrap-sass (~> 3.3, >= 3.3.7)[m
   byebug[m
   coffee-rails (~> 4.1.0)[m
[32m+[m[32m  devise (~> 4.3)[m
   jbuilder (~> 2.0)[m
   jquery-rails[m
   rails (= 4.2.5)[m
[1mdiff --git a/app/views/devise/confirmations/new.html.erb b/app/views/devise/confirmations/new.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..2dc668f[m
[1m--- /dev/null[m
[1m+++ b/app/views/devise/confirmations/new.html.erb[m
[36m@@ -0,0 +1,16 @@[m
[32m+[m[32m<h2>Resend confirmation instructions</h2>[m
[32m+[m
[32m+[m[32m<%= form_for(resource, as: resource_name, url: confirmation_path(resource_name), html: { method: :post }) do |f| %>[m
[32m+[m[32m  <%= devise_error_messages! %>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :email %><br />[m
[32m+[m[32m    <%= f.email_field :email, autofocus: true, value: (resource.pending_reconfirmation? ? resource.unconfirmed_email : resource.email) %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <div class="actions">[m
[32m+[m[32m    <%= f.submit "Resend confirmation instructions" %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m<% end %>[m
[32m+[m
[32m+[m[32m<%= render "devise/shared/links" %>[m
[1mdiff --git a/app/views/devise/mailer/confirmation_instructions.html.erb b/app/views/devise/mailer/confirmation_instructions.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..dc55f64[m
[1m--- /dev/null[m
[1m+++ b/app/views/devise/mailer/confirmation_instructions.html.erb[m
[36m@@ -0,0 +1,5 @@[m
[32m+[m[32m<p>Welcome <%= @email %>!</p>[m
[32m+[m
[32m+[m[32m<p>You can confirm your account email through the link below:</p>[m
[32m+[m
[32m+[m[32m<p><%= link_to 'Confirm my account', confirmation_url(@resource, confirmation_token: @token) %></p>[m
[1mdiff --git a/app/views/devise/mailer/email_changed.html.erb b/app/views/devise/mailer/email_changed.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..32f4ba8[m
[1m--- /dev/null[m
[1m+++ b/app/views/devise/mailer/email_changed.html.erb[m
[36m@@ -0,0 +1,7 @@[m
[32m+[m[32m<p>Hello <%= @email %>!</p>[m
[32m+[m
[32m+[m[32m<% if @resource.try(:unconfirmed_email?) %>[m
[32m+[m[32m  <p>We're contacting you to notify you that your email is being changed to <%= @resource.unconfirmed_email %>.</p>[m
[32m+[m[32m<% else %>[m
[32m+[m[32m  <p>We're contacting you to notify you that your email has been changed to <%= @resource.email %>.</p>[m
[32m+[m[32m<% end %>[m
[1mdiff --git a/app/views/devise/mailer/password_change.html.erb b/app/views/devise/mailer/password_change.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..b41daf4[m
[1m--- /dev/null[m
[1m+++ b/app/views/devise/mailer/password_change.html.erb[m
[36m@@ -0,0 +1,3 @@[m
[32m+[m[32m<p>Hello <%= @resource.email %>!</p>[m
[32m+[m
[32m+[m[32m<p>We're contacting you to notify you that your password has been changed.</p>[m
[1mdiff --git a/app/views/devise/mailer/reset_password_instructions.html.erb b/app/views/devise/mailer/reset_password_instructions.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..f667dc1[m
[1m--- /dev/null[m
[1m+++ b/app/views/devise/mailer/reset_password_instructions.html.erb[m
[36m@@ -0,0 +1,8 @@[m
[32m+[m[32m<p>Hello <%= @resource.email %>!</p>[m
[32m+[m
[32m+[m[32m<p>Someone has requested a link to change your password. You can do this through the link below.</p>[m
[32m+[m
[32m+[m[32m<p><%= link_to 'Change my password', edit_password_url(@resource, reset_password_token: @token) %></p>[m
[32m+[m
[32m+[m[32m<p>If you didn't request this, please ignore this email.</p>[m
[32m+[m[32m<p>Your password won't change until you access the link above and create a new one.</p>[m
[1mdiff --git a/app/views/devise/mailer/unlock_instructions.html.erb b/app/views/devise/mailer/unlock_instructions.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..41e148b[m
[1m--- /dev/null[m
[1m+++ b/app/views/devise/mailer/unlock_instructions.html.erb[m
[36m@@ -0,0 +1,7 @@[m
[32m+[m[32m<p>Hello <%= @resource.email %>!</p>[m
[32m+[m
[32m+[m[32m<p>Your account has been locked due to an excessive number of unsuccessful sign in attempts.</p>[m
[32m+[m
[32m+[m[32m<p>Click the link below to unlock your account:</p>[m
[32m+[m
[32m+[m[32m<p><%= link_to 'Unlock my account', unlock_url(@resource, unlock_token: @token) %></p>[m
[1mdiff --git a/app/views/devise/passwords/edit.html.erb b/app/views/devise/passwords/edit.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..6a796b0[m
[1m--- /dev/null[m
[1m+++ b/app/views/devise/passwords/edit.html.erb[m
[36m@@ -0,0 +1,25 @@[m
[32m+[m[32m<h2>Change your password</h2>[m
[32m+[m
[32m+[m[32m<%= form_for(resource, as: resource_name, url: password_path(resource_name), html: { method: :put }) do |f| %>[m
[32m+[m[32m  <%= devise_error_messages! %>[m
[32m+[m[32m  <%= f.hidden_field :reset_password_token %>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :password, "New password" %><br />[m
[32m+[m[32m    <% if @minimum_password_length %>[m
[32m+[m[32m      <em>(<%= @minimum_password_length %> characters minimum)</em><br />[m
[32m+[m[32m    <% end %>[m
[32m+[m[32m    <%= f.password_field :password, autofocus: true, autocomplete: "off" %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :password_confirmation, "Confirm new password" %><br />[m
[32m+[m[32m    <%= f.password_field :password_confirmation, autocomplete: "off" %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <div class="actions">[m
[32m+[m[32m    <%= f.submit "Change my password" %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m<% end %>[m
[32m+[m
[32m+[m[32m<%= render "devise/shared/links" %>[m
[1mdiff --git a/app/views/devise/passwords/new.html.erb b/app/views/devise/passwords/new.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..3d6d11a[m
[1m--- /dev/null[m
[1m+++ b/app/views/devise/passwords/new.html.erb[m
[36m@@ -0,0 +1,16 @@[m
[32m+[m[32m<h2>Forgot your password?</h2>[m
[32m+[m
[32m+[m[32m<%= form_for(resource, as: resource_name, url: password_path(resource_name), html: { method: :post }) do |f| %>[m
[32m+[m[32m  <%= devise_error_messages! %>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :email %><br />[m
[32m+[m[32m    <%= f.email_field :email, autofocus: true %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <div class="actions">[m
[32m+[m[32m    <%= f.submit "Send me reset password instructions" %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m<% end %>[m
[32m+[m
[32m+[m[32m<%= render "devise/shared/links" %>[m
[1mdiff --git a/app/views/devise/registrations/edit.html.erb b/app/views/devise/registrations/edit.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..1e66f3d[m
[1m--- /dev/null[m
[1m+++ b/app/views/devise/registrations/edit.html.erb[m
[36m@@ -0,0 +1,43 @@[m
[32m+[m[32m<h2>Edit <%= resource_name.to_s.humanize %></h2>[m
[32m+[m
[32m+[m[32m<%= form_for(resource, as: resource_name, url: registration_path(resource_name), html: { method: :put }) do |f| %>[m
[32m+[m[32m  <%= devise_error_messages! %>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :email %><br />[m
[32m+[m[32m    <%= f.email_field :email, autofocus: true %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <% if devise_mapping.confirmable? && resource.pending_reconfirmation? %>[m
[32m+[m[32m    <div>Currently waiting confirmation for: <%= resource.unconfirmed_email %></div>[m
[32m+[m[32m  <% end %>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :password %> <i>(leave blank if you don't want to change it)</i><br />[m
[32m+[m[32m    <%= f.password_field :password, autocomplete: "off" %>[m
[32m+[m[32m    <% if @minimum_password_length %>[m
[32m+[m[32m      <br />[m
[32m+[m[32m      <em><%= @minimum_password_length %> characters minimum</em>[m
[32m+[m[32m    <% end %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :password_confirmation %><br />[m
[32m+[m[32m    <%= f.password_field :password_confirmation, autocomplete: "off" %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :current_password %> <i>(we need your current password to confirm your changes)</i><br />[m
[32m+[m[32m    <%= f.password_field :current_password, autocomplete: "off" %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <div class="actions">[m
[32m+[m[32m    <%= f.submit "Update" %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m<% end %>[m
[32m+[m
[32m+[m[32m<h3>Cancel my account</h3>[m
[32m+[m
[32m+[m[32m<p>Unhappy? <%= button_to "Cancel my account", registration_path(resource_name), data: { confirm: "Are you sure?" }, method: :delete %></p>[m
[32m+[m
[32m+[m[32m<%= link_to "Back", :back %>[m
[1mdiff --git a/app/views/devise/registrations/new.html.erb b/app/views/devise/registrations/new.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..5a238ce[m
[1m--- /dev/null[m
[1m+++ b/app/views/devise/registrations/new.html.erb[m
[36m@@ -0,0 +1,29 @@[m
[32m+[m[32m<h2>Sign up</h2>[m
[32m+[m
[32m+[m[32m<%= form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>[m
[32m+[m[32m  <%= devise_error_messages! %>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :email %><br />[m
[32m+[m[32m    <%= f.email_field :email, autofocus: true %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :password %>[m
[32m+[m[32m    <% if @minimum_password_length %>[m
[32m+[m[32m    <em>(<%= @minimum_password_length %> characters minimum)</em>[m
[32m+[m[32m    <% end %><br />[m
[32m+[m[32m    <%= f.password_field :password, autocomplete: "off" %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :password_confirmation %><br />[m
[32m+[m[32m    <%= f.password_field :password_confirmation, autocomplete: "off" %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <div class="actions">[m
[32m+[m[32m    <%= f.submit "Sign up" %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m<% end %>[m
[32m+[m
[32m+[m[32m<%= render "devise/shared/links" %>[m
[1mdiff --git a/app/views/devise/sessions/new.html.erb b/app/views/devise/sessions/new.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..b261cfd[m
[1m--- /dev/null[m
[1m+++ b/app/views/devise/sessions/new.html.erb[m
[36m@@ -0,0 +1,26 @@[m
[32m+[m[32m<h2>Log in</h2>[m
[32m+[m
[32m+[m[32m<%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :email %><br />[m
[32m+[m[32m    <%= f.email_field :email, autofocus: true %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :password %><br />[m
[32m+[m[32m    <%= f.password_field :password, autocomplete: "off" %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <% if devise_mapping.rememberable? -%>[m
[32m+[m[32m    <div class="field">[m
[32m+[m[32m      <%= f.check_box :remember_me %>[m
[32m+[m[32m      <%= f.label :remember_me %>[m
[32m+[m[32m    </div>[m
[32m+[m[32m  <% end -%>[m
[32m+[m
[32m+[m[32m  <div class="actions">[m
[32m+[m[32m    <%= f.submit "Log in" %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m<% end %>[m
[32m+[m
[32m+[m[32m<%= render "devise/shared/links" %>[m
[1mdiff --git a/app/views/devise/shared/_links.html.erb b/app/views/devise/shared/_links.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..e6a3e41[m
[1m--- /dev/null[m
[1m+++ b/app/views/devise/shared/_links.html.erb[m
[36m@@ -0,0 +1,25 @@[m
[32m+[m[32m<%- if controller_name != 'sessions' %>[m
[32m+[m[32m  <%= link_to "Log in", new_session_path(resource_name) %><br />[m
[32m+[m[32m<% end -%>[m
[32m+[m
[32m+[m[32m<%- if devise_mapping.registerable? && controller_name != 'registrations' %>[m
[32m+[m[32m  <%= link_to "Sign up", new_registration_path(resource_name) %><br />[m
[32m+[m[32m<% end -%>[m
[32m+[m
[32m+[m[32m<%- if devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations' %>[m
[32m+[m[32m  <%= link_to "Forgot your password?", new_password_path(resource_name) %><br />[m
[32m+[m[32m<% end -%>[m
[32m+[m
[32m+[m[32m<%- if devise_mapping.confirmable? && controller_name != 'confirmations' %>[m
[32m+[m[32m  <%= link_to "Didn't receive confirmation instructions?", new_confirmation_path(resource_name) %><br />[m
[32m+[m[32m<% end -%>[m
[32m+[m
[32m+[m[32m<%- if devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks' %>[m
[32m+[m[32m  <%= link_to "Didn't receive unlock instructions?", new_unlock_path(resource_name) %><br />[m
[32m+[m[32m<% end -%>[m
[32m+[m
[32m+[m[32m<%- if devise_mapping.omniauthable? %>[m
[32m+[m[32m  <%- resource_class.omniauth_providers.each do |provider| %>[m
[32m+[m[32m    <%= link_to "Sign in with #{OmniAuth::Utils.camelize(provider)}", omniauth_authorize_path(resource_name, provider) %><br />[m
[32m+[m[32m  <% end -%>[m
[32m+[m[32m<% end -%>[m
[1mdiff --git a/app/views/devise/unlocks/new.html.erb b/app/views/devise/unlocks/new.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..16586bc[m
[1m--- /dev/null[m
[1m+++ b/app/views/devise/unlocks/new.html.erb[m
[36m@@ -0,0 +1,16 @@[m
[32m+[m[32m<h2>Resend unlock instructions</h2>[m
[32m+[m
[32m+[m[32m<%= form_for(resource, as: resource_name, url: unlock_path(resource_name), html: { method: :post }) do |f| %>[m
[32m+[m[32m  <%= devise_error_messages! %>[m
[32m+[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :email %><br />[m
[32m+[m[32m    <%= f.email_field :email, autofocus: true %>[m
[32m+[m[32m  </div>[m
[32m+[m
[32m+[m[32m  <div class="actions">[m
[32m+[m[32m    <%= f.submit "Resend unlock instructions" %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m<% end %>[m
[32m+[m
[32m+[m[32m<%= render "devise/shared/links" %>[m
[1mdiff --git a/app/views/home/_flash.html.erb b/app/views/home/_flash.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb[m
[1mindex 66f73e8..46db065 100644[m
[1m--- a/app/views/layouts/application.html.erb[m
[1m+++ b/app/views/layouts/application.html.erb[m
[36m@@ -10,6 +10,8 @@[m
   <%= render 'home/navbar' %>[m
 [m
 <div class="container">[m
[32m+[m[32m  <p class="notice"><%= notice %></p>[m
[32m+[m[32m  <p class="alert"><%= alert %></p>[m
  <%= yield %>[m
 </div>[m
 [m
[1mdiff --git a/config/environments/development.rb b/config/environments/development.rb[m
[1mindex b55e214..5ce7ab9 100644[m
[1m--- a/config/environments/development.rb[m
[1m+++ b/config/environments/development.rb[m
[36m@@ -38,4 +38,6 @@[m [mRails.application.configure do[m
 [m
   # Raises error for missing translations[m
   # config.action_view.raise_on_missing_translations = true[m
[32m+[m[41m  [m
[32m+[m[32m  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }[m
 end[m
[1mdiff --git a/config/initializers/devise.rb b/config/initializers/devise.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..bccb620[m
[1m--- /dev/null[m
[1m+++ b/config/initializers/devise.rb[m
[36m@@ -0,0 +1,277 @@[m
[32m+[m[32m# Use this hook to configure devise mailer, warden hooks and so forth.[m
[32m+[m[32m# Many of these configuration options can be set straight in your model.[m
[32m+[m[32mDevise.setup do |config|[m
[32m+[m[32m  # The secret key used by Devise. Devise uses this key to generate[m
[32m+[m[32m  # random tokens. Changing this key will render invalid all existing[m
[32m+[m[32m  # confirmation, reset password and unlock tokens in the database.[m
[32m+[m[32m  # Devise will use the `secret_key_base` as its `secret_key`[m
[32m+[m[32m  # by default. You can change it below and use your own secret key.[m
[32m+[m[32m  # config.secret_key = 'd1770cca03b361aea0ba7a5cd65713dc79fb9878094a4c128013063f461a3d0e90df572c36123e0cde3f4845c2714ca9ce3606bd104765732d2792c50528c328'[m
[32m+[m
[32m+[m[32m  # ==> Mailer Configuration[m
[32m+[m[32m  # Configure the e-mail address which will be shown in Devise::Mailer,[m
[32m+[m[32m  # note that it will be overwritten if you use your own mailer class[m
[32m+[m[32m  # with default "from" parameter.[m
[32m+[m[32m  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'[m
[32m+[m
[32m+[m[32m  # Configure the class responsible to send e-mails.[m
[32m+[m[32m  # config.mailer = 'Devise::Mailer'[m
[32m+[m
[32m+[m[32m  # Configure the parent class responsible to send e-mails.[m
[32m+[m[32m  # config.parent_mailer = 'ActionMailer::Base'[m
[32m+[m
[32m+[m[32m  # ==> ORM configuration[m
[32m+[m[32m  # Load and configure the ORM. Supports :active_record (default) and[m
[32m+[m[32m  # :mongoid (bson_ext recommended) by default. Other ORMs may be[m
[32m+[m[32m  # available as additional gems.[m
[32m+[m[32m  require 'devise/orm/active_record'[m
[32m+[m
[32m+[m[32m  # ==> Configuration for any authentication mechanism[m
[32m+[m[32m  # Configure which keys are used when authenticating a user. The default is[m
[32m+[m[32m  # just :email. You can configure it to use [:username, :subdomain], so for[m
[32m+[m[32m  # authenticating a user, both parameters are required. Remember that those[m
[32m+[m[32m  # parameters are used only when authenticating and not when retrieving from[m
[32m+[m[32m  # session. If you need permissions, you should implement that in a before filter.[m
[32m+[m[32m  # You can also supply a hash where the value is a boolean determining whether[m
[32m+[m[32m  # or not authentication should be aborted when the value is not present.[m
[32m+[m[32m  # config.authentication_keys = [:email][m
[32m+[m
[32m+[m[32m  # Configure parameters from the request object used for authentication. Each entry[m
[32m+[m[32m  # given should be a request method and it will automatically be passed to the[m
[32m+[m[32m  # find_for_authentication method and considered in your model lookup. For instance,[m
[32m+[m[32m  # if you set :request_keys to [:subdomain], :subdomain will be used on authentication.[m
[32m+[m[32m  # The same considerations mentioned for authentication_keys also apply to request_keys.[m
[32m+[m[32m  # config.request_keys = [][m
[32m+[m
[32m+[m[32m  # Configure which authentication keys should be case-insensitive.[m
[32m+[m[32m  # These keys will be downcased upon creating or modifying a user and when used[m
[32m+[m[32m  # to authenticate or find a user. Default is :email.[m
[32m+[m[32m  config.case_insensitive_keys = [:email][m
[32m+[m
[32m+[m[32m  # Configure which authentication keys should have whitespace stripped.[m
[32m+[m[32m  # These keys will have whitespace before and after removed upon creating or[m
[32m+[m[32m  # modifying a user and when used to authenticate or find a user. Default is :email.[m
[32m+[m[32m  config.strip_whitespace_keys = [:email][m
[32m+[m
[32m+[m[32m  # Tell if authentication through request.params is enabled. True by default.[m
[32m+[m[32m  # It can be set to an array that will enable params authentication only for the[m
[32m+[m[32m  # given strategies, for example, `config.params_authenticatable = [:database]` will[m
[32m+[m[32m  # enable it only for database (email + password) authentication.[m
[32m+[m[32m  # config.params_authenticatable = true[m
[32m+[m
[32m+[m[32m  # Tell if authentication through HTTP Auth is enabled. False by default.[m
[32m+[m[32m  # It can be set to an array that will enable http authentication only for the[m
[32m+[m[32m  # given strategies, for example, `config.http_authenticatable = [:database]` will[m
[32m+[m[32m  # enable it only for database authentication. The supported strategies are:[m
[32m+[m[32m  # :database      = Support basic authentication with authentication key + password[m
[32m+[m[32m  # config.http_authenticatable = false[m
[32m+[m
[32m+[m[32m  # If 401 status code should be returned for AJAX requests. True by default.[m
[32m+[m[32m  # config.http_authenticatable_on_xhr = true[m
[32m+[m
[32m+[m[32m  # The realm used in Http Basic Authentication. 'Application' by default.[m
[32m+[m[32m  # config.http_authentication_realm = 'Application'[m
[32m+[m
[32m+[m[32m  # It will change confirmation, password recovery and other workflows[m
[32m+[m[32m  # to behave the same regardless if the e-mail provided was right or wrong.[m
[32m+[m[32m  # Does not affect registerable.[m
[32m+[m[32m  # config.paranoid = true[m
[32m+[m
[32m+[m[32m  # By default Devise will store the user in session. You can skip storage for[m
[32m+[m[32m  # particular strategies by setting this option.[m
[32m+[m[32m  # Notice that if you are skipping storage for all authentication paths, you[m
[32m+[m[32m  # may want to disable generating routes to Devise's sessions controller by[m
[32m+[m[32m  # passing skip: :sessions to `devise_for` in your config/routes.rb[m
[32m+[m[32m  config.skip_session_storage = [:http_auth][m
[32m+[m
[32m+[m[32m  # By default, Devise cleans up the CSRF token on authentication to[m
[32m+[m[32m  # avoid CSRF token fixation attacks. This means that, when using AJAX[m
[32m+[m[32m  # requests for sign in and sign up, you need to get a new CSRF token[m
[32m+[m[32m  # from the server. You can disable this option at your own risk.[m
[32m+[m[32m  # config.clean_up_csrf_token_on_authentication = true[m
[32m+[m
[32m+[m[32m  # When false, Devise will not attempt to reload routes on eager load.[m
[32m+[m[32m  # This can reduce the time taken to boot the app but if your application[m
[32m+[m[32m  # requires the Devise mappings to be loaded during boot time the application[m
[32m+[m[32m  # won't boot properly.[m
[32m+[m[32m  # config.reload_routes = true[m
[32m+[m
[32m+[m[32m  # ==> Configuration for :database_authenticatable[m
[32m+[m[32m  # For bcrypt, this is the cost for hashing the password and defaults to 11. If[m
[32m+[m[32m  # using other algorithms, it sets how many times you want the password to be hashed.[m
[32m+[m[32m  #[m
[32m+[m[32m  # Limiting the stretches to just one in testing will increase the performance of[m
[32m+[m[32m  # your test suite dramatically. However, it is STRONGLY RECOMMENDED to not use[m
[32m+[m[32m  # a value less than 10 in other environments. Note that, for bcrypt (the default[m
[32m+[m[32m  # algorithm), the cost increases exponentially with the number of stretches (e.g.[m
[32m+[m[32m  # a value of 20 is already extremely slow: approx. 60 seconds for 1 calculation).[m
[32m+[m[32m  config.stretches = Rails.env.test? ? 1 : 11[m
[32m+[m
[32m+[m[32m  # Set up a pepper to generate the hashed password.[m
[32m+[m[32m  # config.pepper = 'ac5684f57e0ff503a74e6cb8b044aee1b4c0c0a22630000cb33062db9ff046a3668dd88335f0fef95487e54f55492ea4af7d8facd3df8c7a91a8849237df3e29'[m
[32m+[m
[32m+[m[32m  # Send a notification to the original email when the user's email is changed.[m
[32m+[m[32m  # config.send_email_changed_notification = false[m
[32m+[m
[32m+[m[32m  # Send a notification email when the user's password is changed.[m
[32m+[m[32m  # config.send_password_change_notification = false[m
[32m+[m
[32m+[m[32m  # ==> Configuration for :confirmable[m
[32m+[m[32m  # A period that the user is allowed to access the website even without[m
[32m+[m[32m  # confirming their account. For instance, if set to 2.days, the user will be[m
[32m+[m[32m  # able to access the website for two days without confirming their account,[m
[32m+[m[32m  # access will be blocked just in the third day. Default is 0.days, meaning[m
[32m+[m[32m  # the user cannot access the website without confirming their account.[m
[32m+[m[32m  # config.allow_unconfirmed_access_for = 2.days[m
[32m+[m
[32m+[m[32m  # A period that the user is allowed to confirm their account before their[m
[32m+[m[32m  # token becomes invalid. For example, if set to 3.days, the user can confirm[m
[32m+[m[32m  # their account within 3 days after the mail was sent, but on the fourth day[m
[32m+[m[32m  # their account can't be confirmed with the token any more.[m
[32m+[m[32m  # Default is nil, meaning there is no restriction on how long a user can take[m
[32m+[m[32m  # before confirming their account.[m
[32m+[m[32m  # config.confirm_within = 3.days[m
[32m+[m
[32m+[m[32m  # If true, requires any email changes to be confirmed (exactly the same way as[m
[32m+[m[32m  # initial account confirmation) to be applied. Requires additional unconfirmed_email[m
[32m+[m[32m  # db field (see migrations). Until confirmed, new email is stored in[m
[32m+[m[32m  # unconfirmed_email column, and copied to email column on successful confirmation.[m
[32m+[m[32m  config.reconfirmable = true[m
[32m+[m
[32m+[m[32m  # Defines which key will be used when confirming an account[m
[32m+[m[32m  # config.confirmation_keys = [:email][m
[32m+[m
[32m+[m[32m  # ==> Configuration for :rememberable[m
[32m+[m[32m  # The time the user will be remembered without asking for credentials again.[m
[32m+[m[32m  # config.remember_for = 2.weeks[m
[32m+[m
[32m+[m[32m  # Invalidates all the remember me tokens when the user signs out.[m
[32m+[m[32m  config.expire_all_remember_me_on_sign_out = true[m
[32m+[m
[32m+[m[32m  # If true, extends the user's remember period when remembered via cookie.[m
[32m+[m[32m  # config.extend_remember_period = false[m
[32m+[m
[32m+[m[32m  # Options to be passed to the created cookie. For instance, you can set[m
[32m+[m[32m  # secure: true in order to force SSL only cookies.[m
[32m+[m[32m  # config.rememberable_options = {}[m
[32m+[m
[32m+[m[32m  # ==> Configuration for :validatable[m
[32m+[m[32m  # Range for password length.[m
[32m+[m[32m  config.password_length = 6..128[m
[32m+[m
[32m+[m[32m  # Email regex used to validate email formats. It simply asserts that[m
[32m+[m[32m  # one (and only one) @ exists in the given string. This is mainly[m
[32m+[m[32m  # to give user feedback and not to assert the e-mail validity.[m
[32m+[m[32m  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/[m
[32m+[m
[32m+[m[32m  # ==> Configuration for :timeoutable[m
[32m+[m[32m  # The time you want to timeout the user session without activity. After this[m
[32m+[m[32m  # time the user will be asked for credentials again. Default is 30 minutes.[m
[32m+[m[32m  # config.timeout_in = 30.minutes[m
[32m+[m
[32m+[m[32m  # ==> Configuration for :lockable[m
[32m+[m[32m  # Defines which strategy will be used to lock an account.[m
[32m+[m[32m  # :failed_attempts = Locks an account after a number of failed attempts to sign in.[m
[32m+[m[32m  # :none            = No lock strategy. You should handle locking by yourself.[m
[32m+[m[32m  # config.lock_strategy = :failed_attempts[m
[32m+[m
[32m+[m[32m  # Defines which key will be used when locking and unlocking an account[m
[32m+[m[32m  # config.unlock_keys = [:email][m
[32m+[m
[32m+[m[32m  # Defines which strategy will be used to unlock an account.[m
[32m+[m[32m  # :email = Sends an unlock link to the user email[m
[32m+[m[32m  # :time  = Re-enables login after a certain amount of time (see :unlock_in below)[m
[32m+[m[32m  # :both  = Enables both strategies[m
[32m+[m[32m  # :none  = No unlock strategy. You should handle unlocking by yourself.[m
[32m+[m[32m  # config.unlock_strategy = :both[m
[32m+[m
[32m+[m[32m  # Number of authentication tries before locking an account if lock_strategy[m
[32m+[m[32m  # is failed attempts.[m
[32m+[m[32m  # config.maximum_attempts = 20[m
[32m+[m
[32m+[m[32m  # Time interval to unlock the account if :time is enabled as unlock_strategy.[m
[32m+[m[32m  # config.unlock_in = 1.hour[m
[32m+[m
[32m+[m[32m  # Warn on the last attempt before the account is locked.[m
[32m+[m[32m  # config.last_attempt_warning = true[m
[32m+[m
[32m+[m[32m  # ==> Configuration for :recoverable[m
[32m+[m[32m  #[m
[32m+[m[32m  # Defines which key will be used when recovering the password for an account[m
[32m+[m[32m  # config.reset_password_keys = [:email][m
[32m+[m
[32m+[m[32m  # Time interval you can reset your password with a reset password key.[m
[32m+[m[32m  # Don't put a too small interval or your users won't have the time to[m
[32m+[m[32m  # change their passwords.[m
[32m+[m[32m  config.reset_password_within = 6.hours[m
[32m+[m
[32m+[m[32m  # When set to false, does not sign a user in automatically after their password is[m
[32m+[m[32m  # reset. Defaults to true, so a user is signed in automatically after a reset.[m
[32m+[m[32m  # config.sign_in_after_reset_password = true[m
[32m+[m
[32m+[m[32m  # ==> Configuration for :encryptable[m
[32m+[m[32m  # Allow you to use another hashing or encryption algorithm besides bcrypt (default).[m
[32m+[m[32m  # You can use :sha1, :sha512 or algorithms from others authentication tools as[m
[32m+[m[32m  # :clearance_sha1, :authlogic_sha512 (then you should set stretches above to 20[m
[32m+[m[32m  # for default behavior) and :restful_authentication_sha1 (then you should set[m
[32m+[m[32m  # stretches to 10, and copy REST_AUTH_SITE_KEY to pepper).[m
[32m+[m[32m  #[m
[32m+[m[32m  # Require the `devise-encryptable` gem when using anything other than bcrypt[m
[32m+[m[32m  # config.encryptor = :sha512[m
[32m+[m
[32m+[m[32m  # ==> Scopes configuration[m
[32m+[m[32m  # Turn scoped views on. Before rendering "sessions/new", it will first check for[m
[32m+[m[32m  # "users/sessions/new". It's turned off by default because it's slower if you[m
[32m+[m[32m  # are using only default views.[m
[32m+[m[32m  # config.scoped_views = false[m
[32m+[m
[32m+[m[32m  # Configure the default scope given to Warden. By default it's the first[m
[32m+[m[32m  # devise role declared in your routes (usually :user).[m
[32m+[m[32m  # config.default_scope = :user[m
[32m+[m
[32m+[m[32m  # Set this configuration to false if you want /users/sign_out to sign out[m
[32m+[m[32m  # only the current scope. By default, Devise signs out all scopes.[m
[32m+[m[32m  # config.sign_out_all_scopes = true[m
[32m+[m
[32m+[m[32m  # ==> Navigation configuration[m
[32m+[m[32m  # Lists the formats that should be treated as navigational. Formats like[m
[32m+[m[32m  # :html, should redirect to the sign in page when the user does not have[m
[32m+[m[32m  # access, but formats like :xml or :json, should return 401.[m
[32m+[m[32m  #[m
[32m+[m[32m  # If you have any extra navigational formats, like :iphone or :mobile, you[m
[32m+[m[32m  # should add them to the navigational formats lists.[m
[32m+[m[32m  #[m
[32m+[m[32m  # The "*/*" below is required to match Internet Explorer requests.[m
[32m+[m[32m  # config.navigational_formats = ['*/*', :html][m
[32m+[m
[32m+[m[32m  # The default HTTP method used to sign out a resource. Default is :delete.[m
[32m+[m[32m  config.sign_out_via = :delete[m
[32m+[m
[32m+[m[32m  # ==> OmniAuth[m
[32m+[m[32m  # Add a new OmniAuth provider. Check the wiki for more information on setting[m
[32m+[m[32m  # up on your models and hooks.[m
[32m+[m[32m  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'[m
[32m+[m
[32m+[m[32m  # ==> Warden configuration[m
[32m+[m[32m  # If you want to use other strategies, that are not supported by Devise, or[m
[32m+[m[32m  # change the failure app, you can configure them inside the config.warden block.[m
[32m+[m[32m  #[m
[32m+[m[32m  # config.warden do |manager|[m
[32m+[m[32m  #   manager.intercept_401 = false[m
[32m+[m[32m  #   manager.default_strategies(scope: :user).unshift :some_external_strategy[m
[32m+[m[32m  # end[m
[32m+[m
[32m+[m[32m  # ==> Mountable engine configurations[m
[32m+[m[32m  # When using Devise inside an engine, let's call it `MyEngine`, and this engine[m
[32m+[m[32m  # is mountable, there are some extra configurations to be taken into account.[m
[32m+[m[32m  # The following options are available, assuming the engine is mounted as:[m
[32m+[m[32m  #[m
[32m+[m[32m  #     mount MyEngine, at: '/my_engine'[m
[32m+[m[32m  #[m
[32m+[m[32m  # The router that invoked `devise_for`, in the example above, would be:[m
[32m+[m[32m  # config.router_name = :my_engine[m
[32m+[m[32m  #[m
[32m+[m[32m  # When using OmniAuth, Devise cannot automatically set OmniAuth path,[m
[32m+[m[32m  # so you need to do it manually. For the users scope, it would be:[m
[32m+[m[32m  # config.omniauth_path_prefix = '/my_engine/users/auth'[m
[32m+[m[32mend[m
[1mdiff --git a/config/locales/devise.en.yml b/config/locales/devise.en.yml[m
[1mnew file mode 100644[m
[1mindex 0000000..0b8f130[m
[1m--- /dev/null[m
[1m+++ b/config/locales/devise.en.yml[m
[36m@@ -0,0 +1,64 @@[m
[32m+[m[32m# Additional translations at https://github.com/plataformatec/devise/wiki/I18n[m
[32m+[m
[32m+[m[32men:[m
[32m+[m[32m  devise:[m
[32m+[m[32m    confirmations:[m
[32m+[m[32m      confirmed: "Your email address has been successfully confirmed."[m
[32m+[m[32m      send_instructions: "You will receive an email with instructions for how to confirm your email address in a few minutes."[m
[32m+[m[32m      send_paranoid_instructions: "If your email address exists in our database, you will receive an email with instructions for how to confirm your email address in a few minutes."[m
[32m+[m[32m    failure:[m
[32m+[m[32m      already_authenticated: "You are already signed in."[m
[32m+[m[32m      inactive: "Your account is not activated yet."[m
[32m+[m[32m      invalid: "Invalid %{authentication_keys} or password."[m
[32m+[m[32m      locked: "Your account is locked."[m
[32m+[m[32m      last_attempt: "You have one more attempt before your account is locked."[m
[32m+[m[32m      not_found_in_database: "Invalid %{authentication_keys} or password."[m
[32m+[m[32m      timeout: "Your session expired. Please sign in again to continue."[m
[32m+[m[32m      unauthenticated: "You need to sign in or sign up before continuing."[m
[32m+[m[32m      unconfirmed: "You have to confirm your email address before continuing."[m
[32m+[m[32m    mailer:[m
[32m+[m[32m      confirmation_instructions:[m
[32m+[m[32m        subject: "Confirmation instructions"[m
[32m+[m[32m      reset_password_instructions:[m
[32m+[m[32m        subject: "Reset password instructions"[m
[32m+[m[32m      unlock_instructions:[m
[32m+[m[32m        subject: "Unlock instructions"[m
[32m+[m[32m      email_changed:[m
[32m+[m[32m        subject: "Email Changed"[m
[32m+[m[32m      password_change:[m
[32m+[m[32m        subject: "Password Changed"[m
[32m+[m[32m    omniauth_callbacks:[m
[32m+[m[32m      failure: "Could not authenticate you from %{kind} because \"%{reason}\"."[m
[32m+[m[32m      success: "Successfully authenticated from %{kind} account."[m
[32m+[m[32m    passwords:[m
[32m+[m[32m      no_token: "You can't access this page without coming from a password reset email. If you do come from a password reset email, please make sure you used the full URL provided."[m
[32m+[m[32m      send_instructions: "You will receive an email with instructions on how to reset your password in a few minutes."[m
[32m+[m[32m      send_paranoid_instructions: "If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes."[m
[32m+[m[32m      updated: "Your password has been changed successfully. You are now signed in."[m
[32m+[m[32m      updated_not_active: "Your password has been changed successfully."[m
[32m+[m[32m    registrations:[m
[32m+[m[32m      destroyed: "Bye! Your account has been successfully cancelled. We hope to see you again soon."[m
[32m+[m[32m      signed_up: "Welcome! You have signed up successfully."[m
[32m+[m[32m      signed_up_but_inactive: "You have signed up successfully. However, we could not sign you in because your account is not yet activated."[m
[32m+[m[32m      signed_up_but_locked: "You have signed up successfully. However, we could not sign you in because your account is locked."[m
[32m+[m[32m      signed_up_but_unconfirmed: "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."[m
[32m+[m[32m      update_needs_confirmation: "You updated your account successfully, but we need to verify your new email address. Please check your email and follow the confirm link to confirm your new email address."[m
[32m+[m[32m      updated: "Your account has been updated successfully."[m
[32m+[m[32m    sessions:[m
[32m+[m[32m      signed_in: "Signed in successfully."[m
[32m+[m[32m      signed_out: "Signed out successfully."[m
[32m+[m[32m      already_signed_out: "Signed out successfully."[m
[32m+[m[32m    unlocks:[m
[32m+[m[32m      send_instructions: "You will receive an email with instructions for how to unlock your account in a few minutes."[m
[32m+[m[32m      send_paranoid_instructions: "If your account exists, you will receive an email with instructions for how to unlock it in a few minutes."[m
[32m+[m[32m      unlocked: "Your account has been unlocked successfully. Please sign in to continue."[m
[32m+[m[32m  errors:[m
[32m+[m[32m    messages:[m
[32m+[m[32m      already_confirmed: "was already confirmed, please try signing in"[m
[32m+[m[32m      confirmation_period_expired: "needs to be confirmed within %{period}, please request a new one"[m
[32m+[m[32m      expired: "has expired, please request a new one"[m
[32m+[m[32m      not_found: "not found"[m
[32m+[m[32m      not_locked: "was not locked"[m
[32m+[m[32m      not_saved:[m
[32m+[m[32m        one: "1 error prohibited this %{resource} from being saved:"[m
[32m+[m[32m        other: "%{count} errors prohibited this %{resource} from being saved:"[m

[33mcommit 444620e87d4a29f6173eff1ed09c9a933626cb1f[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Fri Nov 17 12:14:54 2017 +0000

    Stock Data Return Formatting

[1mdiff --git a/app/views/home/index.html.erb b/app/views/home/index.html.erb[m
[1mindex d44997f..41923b2 100644[m
[1m--- a/app/views/home/index.html.erb[m
[1m+++ b/app/views/home/index.html.erb[m
[36m@@ -10,7 +10,13 @@[m
     <strong>Conpany name:</strong><%= @stock.name %> - <%= @stock.symbol %><br/>[m
     <strong>Current ask:</strong><%= @stock.l %><br/>[m
     <strong>Earrings per share:</strong><%= @stock.eps %><br/>[m
[31m-    <strong>price/earning ratio:</strong><%= @stock.pe %><br/>[m
[32m+[m[32m    <strong>Price/Earning Ratio:</strong><%= @stock.pe %><br/>[m
[32m+[m[32m    <strong>Market cap:</strong><%= @stock.mc %><br/>[m
[32m+[m[32m    <strong>Stock Open:</strong><%= @stock.op %><br/>[m
[32m+[m[32m    <strong>Day's Range:</strong><%= @stock.lo %> - <%= @stock.hi %><br/>[m
[32m+[m[32m    <strong>Year High:</strong><%= @stock.hi52 %><br/>[m
[32m+[m[32m    <strong>Year Low:</strong><%= @stock.lo52 %><br/>[m
[32m+[m[41m    [m
 [m
 <% elsif @nothing %>[m
     <%= @nothing %>[m

[33mcommit e5b7ae4e4719ecfd84b59a0307e459f8c5eba8da[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Fri Nov 17 12:06:05 2017 +0000

    Stock Quote Error Handing

[1mdiff --git a/app/controllers/home_controller.rb b/app/controllers/home_controller.rb[m
[1mindex f217510..0168388 100644[m
[1m--- a/app/controllers/home_controller.rb[m
[1m+++ b/app/controllers/home_controller.rb[m
[36m@@ -1,5 +1,18 @@[m
 class HomeController < ApplicationController[m
   def index[m
[32m+[m[32m    if params[:id] == ""[m
[32m+[m[32m      @nothing = "Hey, you forgot to enter a symbol"[m
[32m+[m[32m    elsif[m
[32m+[m[41m      [m
[32m+[m[32m      if params[:id][m
[32m+[m[32m        begin[m
[32m+[m[32m          @stock = StockQuote::Stock.quote(params[:id])[m
[32m+[m[32m        rescue StandardError[m
[32m+[m[32m          @error = "That Stock Symbol Does't Exist... please try again."[m
[32m+[m[32m        end[m
[32m+[m[41m        [m
[32m+[m[32m      end[m
[32m+[m[32m    end[m
   end[m
   [m
   def about[m
[1mdiff --git a/app/views/home/index.html.erb b/app/views/home/index.html.erb[m
[1mindex e124edd..d44997f 100644[m
[1m--- a/app/views/home/index.html.erb[m
[1m+++ b/app/views/home/index.html.erb[m
[36m@@ -6,6 +6,18 @@[m
 [m
 <br/><br/>[m
 [m
[31m-<% stock = StockQuote::Stock.quote("goog") %>[m
[31m-<%= stock.name %>[m
[32m+[m[32m<% if @stock %>[m
[32m+[m[32m    <strong>Conpany name:</strong><%= @stock.name %> - <%= @stock.symbol %><br/>[m
[32m+[m[32m    <strong>Current ask:</strong><%= @stock.l %><br/>[m
[32m+[m[32m    <strong>Earrings per share:</strong><%= @stock.eps %><br/>[m
[32m+[m[32m    <strong>price/earning ratio:</strong><%= @stock.pe %><br/>[m
[32m+[m
[32m+[m[32m<% elsif @nothing %>[m
[32m+[m[32m    <%= @nothing %>[m
[32m+[m[32m<% end %>[m
[32m+[m
[32m+[m
[32m+[m[32m<% if @error %>[m
[32m+[m[32m    <%= @error%>[m
[32m+[m[32m<% end %>[m
 [m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex 9476d26..4b54732 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -2,6 +2,8 @@[m [mRails.application.routes.draw do[m
  # get 'home/index'[m
   root 'home#index'[m
   get 'home/about'[m
[32m+[m[41m  [m
[32m+[m[32m  post "/" => 'home#index'[m
 [m
   # The priority is based upon order of creation: first created -> highest priority.[m
   # See how all your routes lay out with "rake routes".[m

[33mcommit 68b88c260c3531f37fe0315ed9fd28fe93d6c8d9[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Fri Nov 17 11:39:29 2017 +0000

    Creating A stock quote Lookup Form

[1mdiff --git a/app/views/home/index.html.erb b/app/views/home/index.html.erb[m
[1mindex a12e79b..e124edd 100644[m
[1m--- a/app/views/home/index.html.erb[m
[1m+++ b/app/views/home/index.html.erb[m
[36m@@ -1,7 +1,10 @@[m
[31m-<h1>stocker</h1>[m
[31m-<p>stocker my app</p>[m
[32m+[m[32m<%= form_tag root_path, :method => 'POST' do %>[m
[32m+[m[32m    <%= text_field_tag 'id', nil, placeholder: 'Enter Conpany Ticker Symbol', size: 50 %>[m
[32m+[m[32m    <%= submit_tag 'Luckup stock quote' %>[m
[32m+[m[32m<% end %>[m
 [m
[31m-<br/>[m
[32m+[m
[32m+[m[32m<br/><br/>[m
 [m
 <% stock = StockQuote::Stock.quote("goog") %>[m
 <%= stock.name %>[m

[33mcommit f4e5552f03cd85f82d4419c761efff5d6b348846[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Fri Nov 17 11:32:49 2017 +0000

    installing the stock quote gem

[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex e8481f2..e1fb2f4 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -10,6 +10,7 @@[m [mgem 'turbolinks'[m
 gem 'jbuilder', '~> 2.0'[m
 gem 'sdoc', '~> 0.4.0', group: :doc[m
 gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'[m
[32m+[m[32mgem 'stock_quote', '~> 1.5', '>= 1.5.2'[m
 [m
 group :development, :test do[m
   gem 'byebug'[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex ddea7d8..25cde2f 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -55,11 +55,15 @@[m [mGEM[m
     coffee-script-source (1.12.2)[m
     concurrent-ruby (1.0.5)[m
     debug_inspector (0.0.3)[m
[32m+[m[32m    domain_name (0.5.20170404)[m
[32m+[m[32m      unf (>= 0.0.5, < 1.0.0)[m
     erubis (2.7.0)[m
     execjs (2.7.0)[m
     ffi (1.9.18)[m
     globalid (0.4.0)[m
       activesupport (>= 4.2.0)[m
[32m+[m[32m    http-cookie (1.0.3)[m
[32m+[m[32m      domain_name (~> 0.5)[m
     i18n (0.8.6)[m
     jbuilder (2.7.0)[m
       activesupport (>= 4.2.0)[m
[36m@@ -79,6 +83,7 @@[m [mGEM[m
     mini_portile2 (2.2.0)[m
     minitest (5.10.3)[m
     multi_json (1.12.1)[m
[32m+[m[32m    netrc (0.11.0)[m
     nokogiri (1.8.0)[m
       mini_portile2 (~> 2.2.0)[m
     rack (1.6.8)[m
[36m@@ -113,6 +118,10 @@[m [mGEM[m
     rb-inotify (0.9.10)[m
       ffi (>= 0.5.0, < 2)[m
     rdoc (4.3.0)[m
[32m+[m[32m    rest-client (2.0.2)[m
[32m+[m[32m      http-cookie (>= 1.0.2, < 2.0)[m
[32m+[m[32m      mime-types (>= 1.16, < 4.0)[m
[32m+[m[32m      netrc (~> 0.8)[m
     sass (3.5.1)[m
       sass-listen (~> 4.0.0)[m
     sass-listen (4.0.0)[m
[36m@@ -137,6 +146,9 @@[m [mGEM[m
       activesupport (>= 4.0)[m
       sprockets (>= 3.0.0)[m
     sqlite3 (1.3.13)[m
[32m+[m[32m    stock_quote (1.5.2)[m
[32m+[m[32m      json[m
[32m+[m[32m      rest-client (~> 2.0.2)[m
     thor (0.20.0)[m
     thread_safe (0.3.6)[m
     tilt (2.0.8)[m
[36m@@ -147,6 +159,9 @@[m [mGEM[m
       thread_safe (~> 0.1)[m
     uglifier (3.2.0)[m
       execjs (>= 0.3.0, < 3)[m
[32m+[m[32m    unf (0.1.4)[m
[32m+[m[32m      unf_ext[m
[32m+[m[32m    unf_ext (0.0.7.4)[m
     web-console (2.3.0)[m
       activemodel (>= 4.0)[m
       binding_of_caller (>= 0.7.2)[m
[36m@@ -167,6 +182,7 @@[m [mDEPENDENCIES[m
   sdoc (~> 0.4.0)[m
   spring[m
   sqlite3[m
[32m+[m[32m  stock_quote (~> 1.5, >= 1.5.2)[m
   turbolinks[m
   uglifier (>= 1.3.0)[m
   web-console (~> 2.0)[m
[1mdiff --git a/app/views/home/index.html.erb b/app/views/home/index.html.erb[m
[1mindex 44ebc94..a12e79b 100644[m
[1m--- a/app/views/home/index.html.erb[m
[1m+++ b/app/views/home/index.html.erb[m
[36m@@ -1,2 +1,8 @@[m
 <h1>stocker</h1>[m
[31m-<p>stocker my app</p>[m
\ No newline at end of file[m
[32m+[m[32m<p>stocker my app</p>[m
[32m+[m
[32m+[m[32m<br/>[m
[32m+[m
[32m+[m[32m<% stock = StockQuote::Stock.quote("goog") %>[m
[32m+[m[32m<%= stock.name %>[m
[41m+[m

[33mcommit 668964942f79fb37e483948eddaedb6ff660b453[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Thu Nov 16 02:02:58 2017 +0000

    Creating a navbar with Bootstrap

[1mdiff --git a/app/views/home/_navbar.html.erb b/app/views/home/_navbar.html.erb[m
[1mindex 737a640..4ae333a 100644[m
[1m--- a/app/views/home/_navbar.html.erb[m
[1m+++ b/app/views/home/_navbar.html.erb[m
[36m@@ -1,2 +1,27 @@[m
[31m-<%= link_to 'Home', root_path %>  |[m
[31m-<%= link_to 'About Us', home_about_path %>[m
[32m+[m[32m<nav class="navbar navbar-default">[m
[32m+[m[32m  <div class="container">[m
[32m+[m[32m    <!-- Brand and toggle get grouped for better mobile display -->[m
[32m+[m[32m    <div class="navbar-header">[m
[32m+[m[32m      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">[m
[32m+[m[32m        <span class="sr-only">Toggle navigation</span>[m
[32m+[m[32m        <span class="icon-bar"></span>[m
[32m+[m[32m        <span class="icon-bar"></span>[m
[32m+[m[32m        <span class="icon-bar"></span>[m
[32m+[m[32m      </button>[m
[32m+[m[32m      <%= link_to 'Stocker', root_path, class: "navbar-brand" %>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <!-- Collect the nav links, forms, and other content for toggling -->[m
[32m+[m[32m    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">[m
[32m+[m[32m      <ul class="nav navbar-nav">[m
[32m+[m[41m          [m
[32m+[m[32m      </ul>[m
[32m+[m[32m      <ul class="nav navbar-nav navbar-right">[m
[32m+[m[32m        <li><%= link_to 'Home', root_path %></li>[m
[32m+[m[32m        <li><%= link_to 'About Us', home_about_path %></li>[m
[32m+[m[32m      </ul>[m
[32m+[m[32m    </div><!-- /.navbar-collapse -->[m
[32m+[m[32m  </div><!-- /.container-fluid -->[m
[32m+[m[32m</nav>[m
[41m+[m
[41m+[m
[41m+[m
[1mdiff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb[m
[1mindex d75a7b7..66f73e8 100644[m
[1m--- a/app/views/layouts/application.html.erb[m
[1m+++ b/app/views/layouts/application.html.erb[m
[36m@@ -1,7 +1,7 @@[m
 <!DOCTYPE html>[m
 <html>[m
 <head>[m
[31m-  <title>Workspace</title>[m
[32m+[m[32m  <title>Stocker</title>[m
   <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>[m
   <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>[m
   <%= csrf_meta_tags %>[m
[36m@@ -9,7 +9,9 @@[m
 <body>[m
   <%= render 'home/navbar' %>[m
 [m
[31m-<%= yield %>[m
[32m+[m[32m<div class="container">[m
[32m+[m[32m <%= yield %>[m
[32m+[m[32m</div>[m
 [m
 </body>[m
 </html>[m

[33mcommit 5bdeb237a5ec073323844dd0c39c06699ba25cc8[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Wed Nov 15 12:31:18 2017 +0000

    bootstrap install

[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex 4fe2a2f..e8481f2 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -9,6 +9,7 @@[m [mgem 'jquery-rails'[m
 gem 'turbolinks'[m
 gem 'jbuilder', '~> 2.0'[m
 gem 'sdoc', '~> 0.4.0', group: :doc[m
[32m+[m[32mgem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'[m
 [m
 group :development, :test do[m
   gem 'byebug'[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex 6fac23a..ddea7d8 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -37,8 +37,13 @@[m [mGEM[m
       thread_safe (~> 0.3, >= 0.3.4)[m
       tzinfo (~> 1.1)[m
     arel (6.0.4)[m
[32m+[m[32m    autoprefixer-rails (7.1.6)[m
[32m+[m[32m      execjs[m
     binding_of_caller (0.7.2)[m
       debug_inspector (>= 0.0.1)[m
[32m+[m[32m    bootstrap-sass (3.3.7)[m
[32m+[m[32m      autoprefixer-rails (>= 5.2.1)[m
[32m+[m[32m      sass (>= 3.3.4)[m
     builder (3.2.3)[m
     byebug (9.1.0)[m
     coffee-rails (4.1.1)[m
[36m@@ -152,6 +157,7 @@[m [mPLATFORMS[m
   ruby[m
 [m
 DEPENDENCIES[m
[32m+[m[32m  bootstrap-sass (~> 3.3, >= 3.3.7)[m
   byebug[m
   coffee-rails (~> 4.1.0)[m
   jbuilder (~> 2.0)[m
[1mdiff --git a/app/assets/javascripts/application.js b/app/assets/javascripts/application.js[m
[1mindex e07c5a8..7465856 100644[m
[1m--- a/app/assets/javascripts/application.js[m
[1m+++ b/app/assets/javascripts/application.js[m
[36m@@ -13,4 +13,5 @@[m
 //= require jquery[m
 //= require jquery_ujs[m
 //= require turbolinks[m
[32m+[m[32m//= require bootstrap-sprockets[m
 //= require_tree .[m
[1mdiff --git a/app/assets/stylesheets/bootstraply.css.scss b/app/assets/stylesheets/bootstraply.css.scss[m
[1mnew file mode 100644[m
[1mindex 0000000..abccfca[m
[1m--- /dev/null[m
[1m+++ b/app/assets/stylesheets/bootstraply.css.scss[m
[36m@@ -0,0 +1,2 @@[m
[32m+[m[32m@import "bootstrap-sprockets";[m
[32m+[m[32m@import "bootstrap";[m
\ No newline at end of file[m

[33mcommit 6e623abc64c617b64b451866bf9ef2f7364ea113[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Wed Nov 15 12:17:36 2017 +0000

    create navbar

[1mdiff --git a/app/views/home/_navbar.html.erb b/app/views/home/_navbar.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..737a640[m
[1m--- /dev/null[m
[1m+++ b/app/views/home/_navbar.html.erb[m
[36m@@ -0,0 +1,2 @@[m
[32m+[m[32m<%= link_to 'Home', root_path %>  |[m
[32m+[m[32m<%= link_to 'About Us', home_about_path %>[m
[1mdiff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb[m
[1mindex 11c2eb8..d75a7b7 100644[m
[1m--- a/app/views/layouts/application.html.erb[m
[1m+++ b/app/views/layouts/application.html.erb[m
[36m@@ -7,6 +7,7 @@[m
   <%= csrf_meta_tags %>[m
 </head>[m
 <body>[m
[32m+[m[32m  <%= render 'home/navbar' %>[m
 [m
 <%= yield %>[m
 [m

[33mcommit e53bb74cba1b5503e38b275ca30316ea11873577[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Wed Nov 15 11:59:48 2017 +0000

    added homepage and about page

[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex 8f905ae..4fe2a2f 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -1,7 +1,5 @@[m
 source 'https://rubygems.org'[m
 [m
[31m-# this is a commit[m
[31m-[m
 gem 'rails', '4.2.5'[m
 gem 'sqlite3'[m
 gem 'sass-rails', '~> 5.0'[m
[1mdiff --git a/app/assets/javascripts/home.coffee b/app/assets/javascripts/home.coffee[m
[1mnew file mode 100644[m
[1mindex 0000000..24f83d1[m
[1m--- /dev/null[m
[1m+++ b/app/assets/javascripts/home.coffee[m
[36m@@ -0,0 +1,3 @@[m
[32m+[m[32m# Place all the behaviors and hooks related to the matching controller here.[m
[32m+[m[32m# All this logic will automatically be available in application.js.[m
[32m+[m[32m# You can use CoffeeScript in this file: http://coffeescript.org/[m
[1mdiff --git a/app/assets/stylesheets/home.scss b/app/assets/stylesheets/home.scss[m
[1mnew file mode 100644[m
[1mindex 0000000..f0ddc68[m
[1m--- /dev/null[m
[1m+++ b/app/assets/stylesheets/home.scss[m
[36m@@ -0,0 +1,3 @@[m
[32m+[m[32m// Place all the styles related to the home controller here.[m
[32m+[m[32m// They will automatically be included in application.css.[m
[32m+[m[32m// You can use Sass (SCSS) here: http://sass-lang.com/[m
[1mdiff --git a/app/controllers/home_controller.rb b/app/controllers/home_controller.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..f217510[m
[1m--- /dev/null[m
[1m+++ b/app/controllers/home_controller.rb[m
[36m@@ -0,0 +1,8 @@[m
[32m+[m[32mclass HomeController < ApplicationController[m
[32m+[m[32m  def index[m
[32m+[m[32m  end[m
[32m+[m[41m  [m
[32m+[m[32m  def about[m
[32m+[m[32m  end[m
[32m+[m[41m  [m
[32m+[m[32mend[m
[1mdiff --git a/app/helpers/home_helper.rb b/app/helpers/home_helper.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..23de56a[m
[1m--- /dev/null[m
[1m+++ b/app/helpers/home_helper.rb[m
[36m@@ -0,0 +1,2 @@[m
[32m+[m[32mmodule HomeHelper[m
[32m+[m[32mend[m
[1mdiff --git a/app/views/home/about.html.erb b/app/views/home/about.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..7b78159[m
[1m--- /dev/null[m
[1m+++ b/app/views/home/about.html.erb[m
[36m@@ -0,0 +1,2 @@[m
[32m+[m[32m<h1>stocker about pages</h1>[m
[32m+[m[32m<p>stocker my app</p>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/home/index.html.erb b/app/views/home/index.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..44ebc94[m
[1m--- /dev/null[m
[1m+++ b/app/views/home/index.html.erb[m
[36m@@ -0,0 +1,2 @@[m
[32m+[m[32m<h1>stocker</h1>[m
[32m+[m[32m<p>stocker my app</p>[m
\ No newline at end of file[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex 3f66539..9476d26 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -1,4 +1,8 @@[m
 Rails.application.routes.draw do[m
[32m+[m[32m # get 'home/index'[m
[32m+[m[32m  root 'home#index'[m
[32m+[m[32m  get 'home/about'[m
[32m+[m
   # The priority is based upon order of creation: first created -> highest priority.[m
   # See how all your routes lay out with "rake routes".[m
 [m
[1mdiff --git a/test/controllers/home_controller_test.rb b/test/controllers/home_controller_test.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..0d9bb47[m
[1m--- /dev/null[m
[1m+++ b/test/controllers/home_controller_test.rb[m
[36m@@ -0,0 +1,9 @@[m
[32m+[m[32mrequire 'test_helper'[m
[32m+[m
[32m+[m[32mclass HomeControllerTest < ActionController::TestCase[m
[32m+[m[32m  test "should get index" do[m
[32m+[m[32m    get :index[m
[32m+[m[32m    assert_response :success[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32mend[m

[33mcommit 94e580838a4fe640ac8b3d793ac2e2873c7df9cd[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Wed Nov 15 11:45:28 2017 +0000

    Added a commit to Gemfile

[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex cf74099..8f905ae 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -1,5 +1,6 @@[m
 source 'https://rubygems.org'[m
 [m
[32m+[m[32m# this is a commit[m
 [m
 gem 'rails', '4.2.5'[m
 gem 'sqlite3'[m

[33mcommit 64ebad9f0903601149cd1414c31cb579d394e7dd[m
Author: Haruki Miyagi <haruki.miyagi1112@gmail.com>
Date:   Wed Nov 15 11:32:46 2017 +0000

    initial commit

[1mdiff --git a/.gitignore b/.gitignore[m
[1mnew file mode 100644[m
[1mindex 0000000..050c9d9[m
[1m--- /dev/null[m
[1m+++ b/.gitignore[m
[36m@@ -0,0 +1,17 @@[m
[32m+[m[32m# See https://help.github.com/articles/ignoring-files for more about ignoring files.[m
[32m+[m[32m#[m
[32m+[m[32m# If you find yourself ignoring temporary files generated by your text editor[m
[32m+[m[32m# or operating system, you probably want to add a global ignore instead:[m
[32m+[m[32m#   git config --global core.excludesfile '~/.gitignore_global'[m
[32m+[m
[32m+[m[32m# Ignore bundler config.[m
[32m+[m[32m/.bundle[m
[32m+[m
[32m+[m[32m# Ignore the default SQLite database.[m
[32m+[m[32m/db/*.sqlite3[m
[32m+[m[32m/db/*.sqlite3-journal[m
[32m+[m
[32m+[m[32m# Ignore all logfiles and tempfiles.[m
[32m+[m[32m/log/*[m
[32m+[m[32m!/log/.keep[m
[32m+[m[32m/tmp[m
[1mdiff --git a/Gemfile b/Gemfile[m
[1mnew file mode 100644[m
[1mindex 0000000..cf74099[m
[1m--- /dev/null[m
[1m+++ b/Gemfile[m
[36m@@ -0,0 +1,22 @@[m
[32m+[m[32msource 'https://rubygems.org'[m
[32m+[m
[32m+[m
[32m+[m[32mgem 'rails', '4.2.5'[m
[32m+[m[32mgem 'sqlite3'[m
[32m+[m[32mgem 'sass-rails', '~> 5.0'[m
[32m+[m[32mgem 'uglifier', '>= 1.3.0'[m
[32m+[m[32mgem 'coffee-rails', '~> 4.1.0'[m
[32m+[m[32mgem 'jquery-rails'[m
[32m+[m[32mgem 'turbolinks'[m
[32m+[m[32mgem 'jbuilder', '~> 2.0'[m
[32m+[m[32mgem 'sdoc', '~> 0.4.0', group: :doc[m
[32m+[m
[32m+[m[32mgroup :development, :test do[m
[32m+[m[32m  gem 'byebug'[m
[32m+[m[32mend[m
[32m+[m
[32m+[m[32mgroup :development do[m
[32m+[m[32m  gem 'web-console', '~> 2.0'[m
[32m+[m[32m  gem 'spring'[m
[32m+[m[32mend[m
[32m+[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mnew file mode 100644[m
[1mindex 0000000..6fac23a[m
[1m--- /dev/null[m
[1m+++ b/Gemfile.lock[m
[36m@@ -0,0 +1,169 @@[m
[32m+[m[32mGEM[m
[32m+[m[32m  remote: https://rubygems.org/[m
[32m+[m[32m  specs:[m
[32m+[m[32m    actionmailer (4.2.5)[m
[32m+[m[32m      actionpack (= 4.2.5)[m
[32m+[m[32m      actionview (= 4.2.5)[m
[32m+[m[32m      activejob (= 4.2.5)[m
[32m+[m[32m      mail (~> 2.5, >= 2.5.4)[m
[32m+[m[32m      rails-dom-testing (~> 1.0, >= 1.0.5)[m
[32m+[m[32m    actionpack (4.2.5)[m
[32m+[m[32m      actionview (= 4.2.5)[m
[32m+[m[32m      activesupport (= 4.2.5)[m
[32m+[m[32m      rack (~> 1.6)[m
[32m+[m[32m      rack-test (~> 0.6.2)[m
[32m+[m[32m      rails-dom-testing (~> 1.0, >= 1.0.5)[m
[32m+[m[32m      rails-html-sanitizer (~> 1.0, >= 1.0.2)[m
[32m+[m[32m    actionview (4.2.5)[m
[32m+[m[32m      activesupport (= 4.2.5)[m
[32m+[m[32m      builder (~> 3.1)[m
[32m+[m[32m      erubis (~> 2.7.0)[m
[32m+[m[32m      rails-dom-testing (~> 1.0, >= 1.0.5)[m
[32m+[m[32m      rails-html-sanitizer (~> 1.0, >= 1.0.2)[m
[32m+[m[32m    activejob (4.2.5)[m
[32m+[m[32m      activesupport (= 4.2.5)[m
[32m+[m[32m      globalid (>= 0.3.0)[m
[32m+[m[32m    activemodel (4.2.5)[m
[32m+[m[32m      activesupport (= 4.2.5)[m
[32m+[m[32m      builder (~> 3.1)[m
[32m+[m[32m    activerecord (4.2.5)[m
[32m+[m[32m      activemodel (= 4.2.5)[m
[32m+[m[32m      activesupport (= 4.2.5)[m
[32m+[m[32m      arel (~> 6.0)[m
[32m+[m[32m    activesupport (4.2.5)[m
[32m+[m[32m      i18n (~> 0.7)[m
[32m+[m[32m      json (~> 1.7, >= 1.7.7)[m
[32m+[m[32m      minitest (~> 5.1)[m
[32m+[m[32m      thread_safe (~> 0.3, >= 0.3.4)[m
[32m+[m[32m      tzinfo (~> 1.1)[m
[32m+[m[32m    arel (6.0.4)[m
[32m+[m[32m    binding_of_caller (0.7.2)[m
[32m+[m[32m      debug_inspector (>= 0.0.1)[m
[32m+[m[32m    builder (3.2.3)[m
[32m+[m[32m    byebug (9.1.0)[m
[32m+[m[32m    coffee-rails (4.1.1)[m
[32m+[m[32m      coffee-script (>= 2.2.0)[m
[32m+[m[32m      railties (>= 4.0.0, < 5.1.x)[m
[32m+[m[32m    coffee-script (2.4.1)[m
[32m+[m[32m      coffee-script-source[m
[32m+[m[32m      execjs[m
[32m+[m[32m    coffee-script-source (1.12.2)[m
[32m+[m[32m    concurrent-ruby (1.0.5)[m
[32m+[m[32m    debug_inspector (0.0.3)[m
[32m+[m[32m    erubis (2.7.0)[m
[32m+[m[32m    execjs (2.7.0)[m
[32m+[m[32m    ffi (1.9.18)[m
[32m+[m[32m    globalid (0.4.0)[m
[32m+[m[32m      activesupport (>= 4.2.0)[m
[32m+[m[32m    i18n (0.8.6)[m
[32m+[m[32m    jbuilder (2.7.0)[m
[32m+[m[32m      activesupport (>= 4.2.0)[m
[32m+[m[32m      multi_json (>= 1.2)[m
[32m+[m[32m    jquery-rails (4.3.1)[m
[32m+[m[32m      rails-dom-testing (>= 1, < 3)[m
[32m+[m[32m      railties (>= 4.2.0)[m
[32m+[m[32m      thor (>= 0.14, < 2.0)[m
[32m+[m[32m    json (1.8.6)[m
[32m+[m[32m    loofah (2.0.3)[m
[32m+[m[32m      nokogiri (>= 1.5.9)[m
[32m+[m[32m    mail (2.6.6)[m
[32m+[m[32m      mime-types (>= 1.16, < 4)[m
[32m+[m[32m    mime-types (3.1)[m
[32m+[m[32m      mime-types-data (~> 3.2015)[m
[32m+[m[32m    mime-types-data (3.2016.0521)[m
[32m+[m[32m    mini_portile2 (2.2.0)[m
[32m+[m[32m    minitest (5.10.3)[m
[32m+[m[32m    multi_json (1.12.1)[m
[32m+[m[32m    nokogiri (1.8.0)[m
[32m+[m[32m      mini_portile2 (~> 2.2.0)[m
[32m+[m[32m    rack (1.6.8)[m
[32m+[m[32m    rack-test (0.6.3)[m
[32m+[m[32m      rack (>= 1.0)[m
[32m+[m[32m    rails (4.2.5)[m
[32m+[m[32m      actionmailer (= 4.2.5)[m
[32m+[m[32m      actionpack (= 4.2.5)[m
[32m+[m[32m      actionview (= 4.2.5)[m
[32m+[m[32m      activejob (= 4.2.5)[m
[32m+[m[32m      activemodel (= 4.2.5)[m
[32m+[m[32m      activerecord (= 4.2.5)[m
[32m+[m[32m      activesupport (= 4.2.5)[m
[32m+[m[32m      bundler (>= 1.3.0, < 2.0)[m
[32m+[m[32m      railties (= 4.2.5)[m
[32m+[m[32m      sprockets-rails[m
[32m+[m[32m    rails-deprecated_sanitizer (1.0.3)[m
[32m+[m[32m      activesupport (>= 4.2.0.alpha)[m
[32m+[m[32m    rails-dom-testing (1.0.8)[m
[32m+[m[32m      activesupport (>= 4.2.0.beta, < 5.0)[m
[32m+[m[32m      nokogiri (~> 1.6)[m
[32m+[m[32m      rails-deprecated_sanitizer (>= 1.0.1)[m
[32m+[m[32m    rails-html-sanitizer (1.0.3)[m
[32m+[m[32m      loofah (~> 2.0)[m
[32m+[m[32m    railties (4.2.5)[m
[32m+[m[32m      actionpack (= 4.2.5)[m
[32m+[m[32m      activesupport (= 4.2.5)[m
[32m+[m[32m      rake (>= 0.8.7)[m
[32m+[m[32m      thor (>= 0.18.1, < 2.0)[m
[32m+[m[32m    rake (12.0.0)[m
[32m+[m[32m    rb-fsevent (0.10.2)[m
[32m+[m[32m    rb-inotify (0.9.10)[m
[32m+[m[32m      ffi (>= 0.5.0, < 2)[m
[32m+[m[32m    rdoc (4.3.0)[m
[32m+[m[32m    sass (3.5.1)[m
[32m+[m[32m      sass-listen (~> 4.0.0)[m
[32m+[m[32m    sass-listen (4.0.0)[m
[32m+[m[32m      rb-fsevent (~> 0.9, >= 0.9.4)[m
[32m+[m[32m      rb-inotify (~> 0.9, >= 0.9.7)[m
[32m+[m[32m    sass-rails (5.0.6)[m
[32m+[m[32m      railties (>= 4.0.0, < 6)[m
[32m+[m[32m      sass (~> 3.1)[m
[32m+[m[32m      sprockets (>= 2.8, < 4.0)[m
[32m+[m[32m      sprockets-rails (>= 2.0, < 4.0)[m
[32m+[m[32m      tilt (>= 1.1, < 3)[m
[32m+[m[32m    sdoc (0.4.2)[m
[32m+[m[32m      json (~> 1.7, >= 1.7.7)[m
[32m+[m[32m      rdoc (~> 4.0)[m
[32m+[m[32m    spring (2.0.2)[m
[32m+[m[32m      activesupport (>= 4.2)[m
[32m+[m[32m    sprockets (3.7.1)[m
[32m+[m[32m      concurrent-ruby (~> 1.0)[m
[32m+[m[32m      rack (> 1, < 3)[m
[32m+[m[32m    sprockets-rails (3.2.0)[m
[32m+[m[32m      actionpack (>= 4.0)[m
[32m+[m[32m      activesupport (>= 4.0)[m
[32m+[m[32m      sprockets (>= 3.0.0)[m
[32m+[m[32m    sqlite3 (1.3.13)[m
[32m+[m[32m    thor (0.20.0)[m
[32m+[m[32m    thread_safe (0.3.6)[m
[32m+[m[32m    tilt (2.0.8)[m
[32m+[m[32m    turbolinks (5.0.1)[m
[32m+[m[32m      turbolinks-source (~> 5)[m
[32m+[m[32m    turbolinks-source (5.0.3)[m
[32m+[m[32m    tzinfo (1.2.3)[m
[32m+[m[32m      thread_safe (~> 0.1)[m
[32m+[m[32m    uglifier (3.2.0)[m
[32m+[m[32m      execjs (>= 0.3.0, < 3)[m
[32m+[m[32m    web-console (2.3.0)[m
[32m+[m[32m      activemodel (>= 4.0)[m
[32m+[m[32m      binding_of_caller (>= 0.7.2)[m
[32m+[m[32m      railties (>= 4.0)[m
[32m+[m[32m      sprockets-rails (>= 2.0, < 4.0)[m
[32m+[m
[32m+[m[32mPLATFORMS[m
[32m+[m[32m  ruby[m
[32m+[m
[32m+[m[32mDEPENDENCIES[m
[32m+[m[32m  byebug[m
[32m+[m[32m  coffee-rails (~> 4.1.0)[m
[32m+[m[32m  jbuilder (~> 2.0)[m
[32m+[m[32m  jquery-rails[m
[32m+[m[32m  rails (= 4.2.5)[m
[32m+[m[32m  sass-rails (~> 5.0)[m
[32m+[m[32m  sdoc (~> 0.4.0)[m
[32m+[m[32m  spring[m
[32m+[m[32m  sqlite3[m
[32m+[m[32m  turbolinks[m
[32m+[m[32m  uglifier (>= 1.3.0)[m
[32m+[m[32m  web-console (~> 2.0)[m
[32m+[m
[32m+[m[32mBUNDLED WITH[m
[32m+[m[32m   1.15.4[m
[1mdiff --git a/README.md b/README.md[m
[1mnew file mode 100644[m
[1mindex 0000000..e62d115[m
[1m--- /dev/null[m
[1m+++ b/README.md[m
[36m@@ -0,0 +1,24 @@[m
[32m+[m
[32m+[m[32m     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.[m
[32m+[m[32m    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'[m
[32m+[m[32m    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--,[m[41m [m
[32m+[m[32m    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.[m
[32m+[m[32m     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'[m
[32m+[m[32m    -----------------------------------------------------------------[m[41m [m
[32m+[m
[32m+[m
[32m+[m[32mWelcome to your Rails project on Cloud9 IDE![m
[32m+[m
[32m+[m[32mTo get started, just do the following:[m
[32m+[m
[32m+[m[32m1. Run the project with the "Run Project" button in the menu bar on top of the IDE.[m
[32m+[m[32m2. Preview your new app by clicking on the URL that appears in the Run panel below (https://HOSTNAME/).[m
[32m+[m
[32m+[m[32mHappy coding![m
[32m+[m[32mThe Cloud9 IDE team[m
[32m+[m
[32m+[m
[32m+[m[32m## Support & Documentation[m
[32m+[m
[32m+[m[32mVisit http://docs.c9.io for support, or to learn more about using Cloud9 IDE.[m[41m [m
[32m+[m[32mTo watch some training videos, visit http://www.youtube.com/user/c9ide[m
[1mdiff --git a/README.rdoc b/README.rdoc[m
[1mnew file mode 100644[m
[1mindex 0000000..dd4e97e[m
[1m--- /dev/null[m
[1m+++ b/README.rdoc[m
[36m@@ -0,0 +1,28 @@[m
[32m+[m[32m== README[m
[32m+[m
[32m+[m[32mThis README would normally document whatever steps are necessary to get the[m
[32m+[m[32mapplication up and running.[m
[32m+[m
[32m+[m[32mThings you may want to cover:[m
[32m+[m
[32m+[m[32m* Ruby version[m
[32m+[m
[32m+[m[32m* System dependencies[m
[32m+[m
[32m+[m[32m* Configuration[m
[32m+[m
[32m+[m[32m* Database creation[m
[32m+[m
[32m+[m[32m* Database initialization[m
[32m+[m
[32m+[m[32m* How to run the test suite[m
[32m+[m
[32m+[m[32m* Services (job queues, cache servers, search engines, etc.)[m
[32m+[m
[32m+[m[32m* Deployment instructions[m
[32m+[m
[32m+[m[32m* ...[m
[32m+[m
[32m+[m
[32m+[m[32mPlease feel free to use a different markup language if you do not plan to run[m
[32m+[m[32m<tt>rake doc:app</tt>.[m
[1mdiff --git a/Rakefile b/Rakefile[m
[1mnew file mode 100644[m
[1mindex 0000000..ba6b733[m
[1m--- /dev/null[m
[1m+++ b/Rakefile[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m[32m# Add your own tasks in files placed in lib/tasks ending in .rake,[m
[32m+[m[32m# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.[m
[32m+[m
[32m+[m[32mrequire File.expand_path('../config/application', __FILE__)[m
[32m+[m
[32m+[m[32mRails.application.load_tasks[m
[1mdiff --git a/app/assets/images/.keep b/app/assets/images/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/app/assets/javascripts/application.js b/app/assets/javascripts/application.js[m
[1mnew file mode 100644[m
[1mindex 0000000..e07c5a8[m
[1m--- /dev/null[m
[1m+++ b/app/assets/javascripts/application.js[m
[36m@@ -0,0 +1,16 @@[m
[32m+[m[32m// This is a manifest file that'll be compiled into application.js, which will include all the files[m
[32m+[m[32m// listed below.[m
[32m+[m[32m//[m
[32m+[m[32m// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,[m
[32m+[m[32m// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.[m
[32m+[m[32m//[m
[32m+[m[32m// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the[m
[32m+[m[32m// compiled file.[m
[32m+[m[32m//[m
[32m+[m[32m// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details[m
[32m+[m[32m// about supported directives.[m
[32m+[m[32m//[m
[32m+[m[32m//= require jquery[m
[32m+[m[32m//= require jquery_ujs[m
[32m+[m[32m//= require turbolinks[m
[32m+[m[32m//= require_tree .[m
[1mdiff --git a/app/assets/stylesheets/application.css b/app/assets/stylesheets/application.css[m
[1mnew file mode 100644[m
[1mindex 0000000..f9cd5b3[m
[1m--- /dev/null[m
[1m+++ b/app/assets/stylesheets/application.css[m
[36m@@ -0,0 +1,15 @@[m
[32m+[m[32m/*[m
[32m+[m[32m * This is a manifest file that'll be compiled into application.css, which will include all the files[m
[32m+[m[32m * listed below.[m
[32m+[m[32m *[m
[32m+[m[32m * Any CSS and SCSS file within this directory, lib/assets/stylesheets, vendor/assets/stylesheets,[m
[32m+[m[32m * or any plugin's vendor/assets/stylesheets directory can be referenced here using a relative path.[m
[32m+[m[32m *[m
[32m+[m[32m * You're free to add application-wide styles to this file and they'll appear at the bottom of the[m
[32m+[m[32m * compiled file so the styles you add here take precedence over styles defined in any styles[m
[32m+[m[32m * defined in the other CSS/SCSS files in this directory. It is generally better to create a new[m
[32m+[m[32m * file per style scope.[m
[32m+[m[32m *[m
[32m+[m[32m *= require_tree .[m
[32m+[m[32m *= require_self[m
[32m+[m[32m */[m
[1mdiff --git a/app/controllers/application_controller.rb b/app/controllers/application_controller.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..d83690e[m
[1m--- /dev/null[m
[1m+++ b/app/controllers/application_controller.rb[m
[36m@@ -0,0 +1,5 @@[m
[32m+[m[32mclass ApplicationController < ActionController::Base[m
[32m+[m[32m  # Prevent CSRF attacks by raising an exception.[m
[32m+[m[32m  # For APIs, you may want to use :null_session instead.[m
[32m+[m[32m  protect_from_forgery with: :exception[m
[32m+[m[32mend[m
[1mdiff --git a/app/controllers/concerns/.keep b/app/controllers/concerns/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/app/helpers/application_helper.rb b/app/helpers/application_helper.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..de6be79[m
[1m--- /dev/null[m
[1m+++ b/app/helpers/application_helper.rb[m
[36m@@ -0,0 +1,2 @@[m
[32m+[m[32mmodule ApplicationHelper[m
[32m+[m[32mend[m
[1mdiff --git a/app/mailers/.keep b/app/mailers/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/app/models/.keep b/app/models/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/app/models/concerns/.keep b/app/models/concerns/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..11c2eb8[m
[1m--- /dev/null[m
[1m+++ b/app/views/layouts/application.html.erb[m
[36m@@ -0,0 +1,14 @@[m
[32m+[m[32m<!DOCTYPE html>[m
[32m+[m[32m<html>[m
[32m+[m[32m<head>[m
[32m+[m[32m  <title>Workspace</title>[m
[32m+[m[32m  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>[m
[32m+[m[32m  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>[m
[32m+[m[32m  <%= csrf_meta_tags %>[m
[32m+[m[32m</head>[m
[32m+[m[32m<body>[m
[32m+[m
[32m+[m[32m<%= yield %>[m
[32m+[m
[32m+[m[32m</body>[m
[32m+[m[32m</html>[m
[1mdiff --git a/bin/bundle b/bin/bundle[m
[1mnew file mode 100755[m
[1mindex 0000000..66e9889[m
[1m--- /dev/null[m
[1m+++ b/bin/bundle[m
[36m@@ -0,0 +1,3 @@[m
[32m+[m[32m#!/usr/bin/env ruby[m
[32m+[m[32mENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)[m
[32m+[m[32mload Gem.bin_path('bundler', 'bundle')[m
[1mdiff --git a/bin/rails b/bin/rails[m
[1mnew file mode 100755[m
[1mindex 0000000..0138d79[m
[1m--- /dev/null[m
[1m+++ b/bin/rails[m
[36m@@ -0,0 +1,9 @@[m
[32m+[m[32m#!/usr/bin/env ruby[m
[32m+[m[32mbegin[m
[32m+[m[32m  load File.expand_path('../spring', __FILE__)[m
[32m+[m[32mrescue LoadError => e[m
[32m+[m[32m  raise unless e.message.include?('spring')[m
[32m+[m[32mend[m
[32m+[m[32mAPP_PATH = File.expand_path('../../config/application', __FILE__)[m
[32m+[m[32mrequire_relative '../config/boot'[m
[32m+[m[32mrequire 'rails/commands'[m
[1mdiff --git a/bin/rake b/bin/rake[m
[1mnew file mode 100755[m
[1mindex 0000000..d87d5f5[m
[1m--- /dev/null[m
[1m+++ b/bin/rake[m
[36m@@ -0,0 +1,9 @@[m
[32m+[m[32m#!/usr/bin/env ruby[m
[32m+[m[32mbegin[m
[32m+[m[32m  load File.expand_path('../spring', __FILE__)[m
[32m+[m[32mrescue LoadError => e[m
[32m+[m[32m  raise unless e.message.include?('spring')[m
[32m+[m[32mend[m
[32m+[m[32mrequire_relative '../config/boot'[m
[32m+[m[32mrequire 'rake'[m
[32m+[m[32mRake.application.run[m
[1mdiff --git a/bin/setup b/bin/setup[m
[1mnew file mode 100755[m
[1mindex 0000000..acdb2c1[m
[1m--- /dev/null[m
[1m+++ b/bin/setup[m
[36m@@ -0,0 +1,29 @@[m
[32m+[m[32m#!/usr/bin/env ruby[m
[32m+[m[32mrequire 'pathname'[m
[32m+[m
[32m+[m[32m# path to your application root.[m
[32m+[m[32mAPP_ROOT = Pathname.new File.expand_path('../../',  __FILE__)[m
[32m+[m
[32m+[m[32mDir.chdir APP_ROOT do[m
[32m+[m[32m  # This script is a starting point to setup your application.[m
[32m+[m[32m  # Add necessary setup steps to this file:[m
[32m+[m
[32m+[m[32m  puts "== Installing dependencies =="[m
[32m+[m[32m  system "gem install bundler --conservative"[m
[32m+[m[32m  system "bundle check || bundle install"[m
[32m+[m
[32m+[m[32m  # puts "\n== Copying sample files =="[m
[32m+[m[32m  # unless File.exist?("config/database.yml")[m
[32m+[m[32m  #   system "cp config/database.yml.sample config/database.yml"[m
[32m+[m[32m  # end[m
[32m+[m
[32m+[m[32m  puts "\n== Preparing database =="[m
[32m+[m[32m  system "bin/rake db:setup"[m
[32m+[m
[32m+[m[32m  puts "\n== Removing old logs and tempfiles =="[m
[32m+[m[32m  system "rm -f log/*"[m
[32m+[m[32m  system "rm -rf tmp/cache"[m
[32m+[m
[32m+[m[32m  puts "\n== Restarting application server =="[m
[32m+[m[32m  system "touch tmp/restart.txt"[m
[32m+[m[32mend[m
[1mdiff --git a/bin/spring b/bin/spring[m
[1mnew file mode 100755[m
[1mindex 0000000..fb2ec2e[m
[1m--- /dev/null[m
[1m+++ b/bin/spring[m
[36m@@ -0,0 +1,17 @@[m
[32m+[m[32m#!/usr/bin/env ruby[m
[32m+[m
[32m+[m[32m# This file loads spring without using Bundler, in order to be fast.[m
[32m+[m[32m# It gets overwritten when you run the `spring binstub` command.[m
[32m+[m
[32m+[m[32munless defined?(Spring)[m
[32m+[m[32m  require 'rubygems'[m
[32m+[m[32m  require 'bundler'[m
[32m+[m
[32m+[m[32m  lockfile = Bundler::LockfileParser.new(Bundler.default_lockfile.read)[m
[32m+[m[32m  spring = lockfile.specs.detect { |spec| spec.name == "spring" }[m
[32m+[m[32m  if spring[m
[32m+[m[32m    Gem.use_paths Gem.dir, Bundler.bundle_path.to_s, *Gem.path[m
[32m+[m[32m    gem 'spring', spring.version[m
[32m+[m[32m    require 'spring/binstub'[m
[32m+[m[32m  end[m
[32m+[m[32mend[m
[1mdiff --git a/config.ru b/config.ru[m
[1mnew file mode 100644[m
[1mindex 0000000..bd83b25[m
[1m--- /dev/null[m
[1m+++ b/config.ru[m
[36m@@ -0,0 +1,4 @@[m
[32m+[m[32m# This file is used by Rack-based servers to start the application.[m
[32m+[m
[32m+[m[32mrequire ::File.expand_path('../config/environment', __FILE__)[m
[32m+[m[32mrun Rails.application[m
[1mdiff --git a/config/application.rb b/config/application.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..f0b73b1[m
[1m--- /dev/null[m
[1m+++ b/config/application.rb[m
[36m@@ -0,0 +1,26 @@[m
[32m+[m[32mrequire File.expand_path('../boot', __FILE__)[m
[32m+[m
[32m+[m[32mrequire 'rails/all'[m
[32m+[m
[32m+[m[32m# Require the gems listed in Gemfile, including any gems[m
[32m+[m[32m# you've limited to :test, :development, or :production.[m
[32m+[m[32mBundler.require(*Rails.groups)[m
[32m+[m
[32m+[m[32mmodule Workspace[m
[32m+[m[32m  class Application < Rails::Application[m
[32m+[m[32m    # Settings in config/environments/* take precedence over those specified here.[m
[32m+[m[32m    # Application configuration should go into files in config/initializers[m
[32m+[m[32m    # -- all .rb files in that directory are automatically loaded.[m
[32m+[m
[32m+[m[32m    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.[m
[32m+[m[32m    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.[m
[32m+[m[32m    # config.time_zone = 'Central Time (US & Canada)'[m
[32m+[m
[32m+[m[32m    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.[m
[32m+[m[32m    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s][m
[32m+[m[32m    # config.i18n.default_locale = :de[m
[32m+[m
[32m+[m[32m    # Do not swallow errors in after_commit/after_rollback callbacks.[m
[32m+[m[32m    config.active_record.raise_in_transactional_callbacks = true[m
[32m+[m[32m  end[m
[32m+[m[32mend[m
[1mdiff --git a/config/boot.rb b/config/boot.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..6b750f0[m
[1m--- /dev/null[m
[1m+++ b/config/boot.rb[m
[36m@@ -0,0 +1,3 @@[m
[32m+[m[32mENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)[m
[32m+[m
[32m+[m[32mrequire 'bundler/setup' # Set up gems listed in the Gemfile.[m
[1mdiff --git a/config/database.yml b/config/database.yml[m
[1mnew file mode 100644[m
[1mindex 0000000..1c1a37c[m
[1m--- /dev/null[m
[1m+++ b/config/database.yml[m
[36m@@ -0,0 +1,25 @@[m
[32m+[m[32m# SQLite version 3.x[m
[32m+[m[32m#   gem install sqlite3[m
[32m+[m[32m#[m
[32m+[m[32m#   Ensure the SQLite 3 gem is defined in your Gemfile[m
[32m+[m[32m#   gem 'sqlite3'[m
[32m+[m[32m#[m
[32m+[m[32mdefault: &default[m
[32m+[m[32m  adapter: sqlite3[m
[32m+[m[32m  pool: 5[m
[32m+[m[32m  timeout: 5000[m
[32m+[m
[32m+[m[32mdevelopment:[m
[32m+[m[32m  <<: *default[m
[32m+[m[32m  database: db/development.sqlite3[m
[32m+[m
[32m+[m[32m# Warning: The database defined as "test" will be erased and[m
[32m+[m[32m# re-generated from your development database when you run "rake".[m
[32m+[m[32m# Do not set this db to the same as development or production.[m
[32m+[m[32mtest:[m
[32m+[m[32m  <<: *default[m
[32m+[m[32m  database: db/test.sqlite3[m
[32m+[m
[32m+[m[32mproduction:[m
[32m+[m[32m  <<: *default[m
[32m+[m[32m  database: db/production.sqlite3[m
[1mdiff --git a/config/environment.rb b/config/environment.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..ee8d90d[m
[1m--- /dev/null[m
[1m+++ b/config/environment.rb[m
[36m@@ -0,0 +1,5 @@[m
[32m+[m[32m# Load the Rails application.[m
[32m+[m[32mrequire File.expand_path('../application', __FILE__)[m
[32m+[m
[32m+[m[32m# Initialize the Rails application.[m
[32m+[m[32mRails.application.initialize![m
[1mdiff --git a/config/environments/development.rb b/config/environments/development.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..b55e214[m
[1m--- /dev/null[m
[1m+++ b/config/environments/development.rb[m
[36m@@ -0,0 +1,41 @@[m
[32m+[m[32mRails.application.configure do[m
[32m+[m[32m  # Settings specified here will take precedence over those in config/application.rb.[m
[32m+[m
[32m+[m[32m  # In the development environment your application's code is reloaded on[m
[32m+[m[32m  # every request. This slows down response time but is perfect for development[m
[32m+[m[32m  # since you don't have to restart the web server when you make code changes.[m
[32m+[m[32m  config.cache_classes = false[m
[32m+[m
[32m+[m[32m  # Do not eager load code on boot.[m
[32m+[m[32m  config.eager_load = false[m
[32m+[m
[32m+[m[32m  # Show full error reports and disable caching.[m
[32m+[m[32m  config.consider_all_requests_local       = true[m
[32m+[m[32m  config.action_controller.perform_caching = false[m
[32m+[m
[32m+[m[32m  # Don't care if the mailer can't send.[m
[32m+[m[32m  config.action_mailer.raise_delivery_errors = false[m
[32m+[m
[32m+[m[32m  # Print deprecation notices to the Rails logger.[m
[32m+[m[32m  config.active_support.deprecation = :log[m
[32m+[m
[32m+[m[32m  # Raise an error on page load if there are pending migrations.[m
[32m+[m[32m  config.active_record.migration_error = :page_load[m
[32m+[m
[32m+[m[32m  # Debug mode disables concatenation and preprocessing of assets.[m
[32m+[m[32m  # This option may cause significant delays in view rendering with a large[m
[32m+[m[32m  # number of complex assets.[m
[32m+[m[32m  config.assets.debug = true[m
[32m+[m
[32m+[m[32m  # Asset digests allow you to set far-future HTTP expiration dates on all assets,[m
[32m+[m[32m  # yet still be able to expire them through the digest params.[m
[32m+[m[32m  config.assets.digest = true[m
[32m+[m
[32m+[m[32m  # Adds additional error checking when serving assets at runtime.[m
[32m+[m[32m  # Checks for improperly declared sprockets dependencies.[m
[32m+[m[32m  # Raises helpful error messages.[m
[32m+[m[32m  config.assets.raise_runtime_errors = true[m
[32m+[m
[32m+[m[32m  # Raises error for missing translations[m
[32m+[m[32m  # config.action_view.raise_on_missing_translations = true[m
[32m+[m[32mend[m
[1mdiff --git a/config/environments/production.rb b/config/environments/production.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..5c1b32e[m
[1m--- /dev/null[m
[1m+++ b/config/environments/production.rb[m
[36m@@ -0,0 +1,79 @@[m
[32m+[m[32mRails.application.configure do[m
[32m+[m[32m  # Settings specified here will take precedence over those in config/application.rb.[m
[32m+[m
[32m+[m[32m  # Code is not reloaded between requests.[m
[32m+[m[32m  config.cache_classes = true[m
[32m+[m
[32m+[m[32m  # Eager load code on boot. This eager loads most of Rails and[m
[32m+[m[32m  # your application in memory, allowing both threaded web servers[m
[32m+[m[32m  # and those relying on copy on write to perform better.[m
[32m+[m[32m  # Rake tasks automatically ignore this option for performance.[m
[32m+[m[32m  config.eager_load = true[m
[32m+[m
[32m+[m[32m  # Full error reports are disabled and caching is turned on.[m
[32m+[m[32m  config.consider_all_requests_local       = false[m
[32m+[m[32m  config.action_controller.perform_caching = true[m
[32m+[m
[32m+[m[32m  # Enable Rack::Cache to put a simple HTTP cache in front of your application[m
[32m+[m[32m  # Add `rack-cache` to your Gemfile before enabling this.[m
[32m+[m[32m  # For large-scale production use, consider using a caching reverse proxy like[m
[32m+[m[32m  # NGINX, varnish or squid.[m
[32m+[m[32m  # config.action_dispatch.rack_cache = true[m
[32m+[m
[32m+[m[32m  # Disable serving static files from the `/public` folder by default since[m
[32m+[m[32m  # Apache or NGINX already handles this.[m
[32m+[m[32m  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?[m
[32m+[m
[32m+[m[32m  # Compress JavaScripts and CSS.[m
[32m+[m[32m  config.assets.js_compressor = :uglifier[m
[32m+[m[32m  # config.assets.css_compressor = :sass[m
[32m+[m
[32m+[m[32m  # Do not fallback to assets pipeline if a precompiled asset is missed.[m
[32m+[m[32m  config.assets.compile = false[m
[32m+[m
[32m+[m[32m  # Asset digests allow you to set far-future HTTP expiration dates on all assets,[m
[32m+[m[32m  # yet still be able to expire them through the digest params.[m
[32m+[m[32m  config.assets.digest = true[m
[32m+[m
[32m+[m[32m  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb[m
[32m+[m
[32m+[m[32m  # Specifies the header that your server uses for sending files.[m
[32m+[m[32m  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache[m
[32m+[m[32m  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX[m
[32m+[m
[32m+[m[32m  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.[m
[32m+[m[32m  # config.force_ssl = true[m
[32m+[m
[32m+[m[32m  # Use the lowest log level to ensure availability of diagnostic information[m
[32m+[m[32m  # when problems arise.[m
[32m+[m[32m  config.log_level = :debug[m
[32m+[m
[32m+[m[32m  # Prepend all log lines with the following tags.[m
[32m+[m[32m  # config.log_tags = [ :subdomain, :uuid ][m
[32m+[m
[32m+[m[32m  # Use a different logger for distributed setups.[m
[32m+[m[32m  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)[m
[32m+[m
[32m+[m[32m  # Use a different cache store in production.[m
[32m+[m[32m  # config.cache_store = :mem_cache_store[m
[32m+[m
[32m+[m[32m  # Enable serving of images, stylesheets, and JavaScripts from an asset server.[m
[32m+[m[32m  # config.action_controller.asset_host = 'http://assets.example.com'[m
[32m+[m
[32m+[m[32m  # Ignore bad email addresses and do not raise email delivery errors.[m
[32m+[m[32m  # Set this to true and configure the email server for immediate delivery to raise delivery errors.[m
[32m+[m[32m  # config.action_mailer.raise_delivery_errors = false[m
[32m+[m
[32m+[m[32m  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to[m
[32m+[m[32m  # the I18n.default_locale when a translation cannot be found).[m
[32m+[m[32m  config.i18n.fallbacks = true[m
[32m+[m
[32m+[m[32m  # Send deprecation notices to registered listeners.[m
[32m+[m[32m  config.active_support.deprecation = :notify[m
[32m+[m
[32m+[m[32m  # Use default logging formatter so that PID and timestamp are not suppressed.[m
[32m+[m[32m  config.log_formatter = ::Logger::Formatter.new[m
[32m+[m
[32m+[m[32m  # Do not dump schema after migrations.[m
[32m+[m[32m  config.active_record.dump_schema_after_migration = false[m
[32m+[m[32mend[m
[1mdiff --git a/config/environments/test.rb b/config/environments/test.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..1c19f08[m
[1m--- /dev/null[m
[1m+++ b/config/environments/test.rb[m
[36m@@ -0,0 +1,42 @@[m
[32m+[m[32mRails.application.configure do[m
[32m+[m[32m  # Settings specified here will take precedence over those in config/application.rb.[m
[32m+[m
[32m+[m[32m  # The test environment is used exclusively to run your application's[m
[32m+[m[32m  # test suite. You never need to work with it otherwise. Remember that[m
[32m+[m[32m  # your test database is "scratch space" for the test suite and is wiped[m
[32m+[m[32m  # and recreated between test runs. Don't rely on the data there![m
[32m+[m[32m  config.cache_classes = true[m
[32m+[m
[32m+[m[32m  # Do not eager load code on boot. This avoids loading your whole application[m
[32m+[m[32m  # just for the purpose of running a single test. If you are using a tool that[m
[32m+[m[32m  # preloads Rails for running tests, you may have to set it to true.[m
[32m+[m[32m  config.eager_load = false[m
[32m+[m
[32m+[m[32m  # Configure static file server for tests with Cache-Control for performance.[m
[32m+[m[32m  config.serve_static_files   = true[m
[32m+[m[32m  config.static_cache_control = 'public, max-age=3600'[m
[32m+[m
[32m+[m[32m  # Show full error reports and disable caching.[m
[32m+[m[32m  config.consider_all_requests_local       = true[m
[32m+[m[32m  config.action_controller.perform_caching = false[m
[32m+[m
[32m+[m[32m  # Raise exceptions instead of rendering exception templates.[m
[32m+[m[32m  config.action_dispatch.show_exceptions = false[m
[32m+[m
[32m+[m[32m  # Disable request forgery protection in test environment.[m
[32m+[m[32m  config.action_controller.allow_forgery_protection = false[m
[32m+[m
[32m+[m[32m  # Tell Action Mailer not to deliver emails to the real world.[m
[32m+[m[32m  # The :test delivery method accumulates sent emails in the[m
[32m+[m[32m  # ActionMailer::Base.deliveries array.[m
[32m+[m[32m  config.action_mailer.delivery_method = :test[m
[32m+[m
[32m+[m[32m  # Randomize the order test cases are executed.[m
[32m+[m[32m  config.active_support.test_order = :random[m
[32m+[m
[32m+[m[32m  # Print deprecation notices to the stderr.[m
[32m+[m[32m  config.active_support.deprecation = :stderr[m
[32m+[m
[32m+[m[32m  # Raises error for missing translations[m
[32m+[m[32m  # config.action_view.raise_on_missing_translations = true[m
[32m+[m[32mend[m
[1mdiff --git a/config/initializers/assets.rb b/config/initializers/assets.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..01ef3e6[m
[1m--- /dev/null[m
[1m+++ b/config/initializers/assets.rb[m
[36m@@ -0,0 +1,11 @@[m
[32m+[m[32m# Be sure to restart your server when you modify this file.[m
[32m+[m
[32m+[m[32m# Version of your assets, change this if you want to expire all your assets.[m
[32m+[m[32mRails.application.config.assets.version = '1.0'[m
[32m+[m
[32m+[m[32m# Add additional assets to the asset load path[m
[32m+[m[32m# Rails.application.config.assets.paths << Emoji.images_path[m
[32m+[m
[32m+[m[32m# Precompile additional assets.[m
[32m+[m[32m# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.[m
[32m+[m[32m# Rails.application.config.assets.precompile += %w( search.js )[m
[1mdiff --git a/config/initializers/backtrace_silencers.rb b/config/initializers/backtrace_silencers.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..59385cd[m
[1m--- /dev/null[m
[1m+++ b/config/initializers/backtrace_silencers.rb[m
[36m@@ -0,0 +1,7 @@[m
[32m+[m[32m# Be sure to restart your server when you modify this file.[m
[32m+[m
[32m+[m[32m# You can add backtrace silencers for libraries that you're using but don't wish to see in your backtraces.[m
[32m+[m[32m# Rails.backtrace_cleaner.add_silencer { |line| line =~ /my_noisy_library/ }[m
[32m+[m
[32m+[m[32m# You can also remove all the silencers if you're trying to debug a problem that might stem from framework code.[m
[32m+[m[32m# Rails.backtrace_cleaner.remove_silencers![m
[1mdiff --git a/config/initializers/cookies_serializer.rb b/config/initializers/cookies_serializer.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..7f70458[m
[1m--- /dev/null[m
[1m+++ b/config/initializers/cookies_serializer.rb[m
[36m@@ -0,0 +1,3 @@[m
[32m+[m[32m# Be sure to restart your server when you modify this file.[m
[32m+[m
[32m+[m[32mRails.application.config.action_dispatch.cookies_serializer = :json[m
[1mdiff --git a/config/initializers/filter_parameter_logging.rb b/config/initializers/filter_parameter_logging.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..4a994e1[m
[1m--- /dev/null[m
[1m+++ b/config/initializers/filter_parameter_logging.rb[m
[36m@@ -0,0 +1,4 @@[m
[32m+[m[32m# Be sure to restart your server when you modify this file.[m
[32m+[m
[32m+[m[32m# Configure sensitive parameters which will be filtered from the log file.[m
[32m+[m[32mRails.application.config.filter_parameters += [:password][m
[1mdiff --git a/config/initializers/inflections.rb b/config/initializers/inflections.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..ac033bf[m
[1m--- /dev/null[m
[1m+++ b/config/initializers/inflections.rb[m
[36m@@ -0,0 +1,16 @@[m
[32m+[m[32m# Be sure to restart your server when you modify this file.[m
[32m+[m
[32m+[m[32m# Add new inflection rules using the following format. Inflections[m
[32m+[m[32m# are locale specific, and you may define rules for as many different[m
[32m+[m[32m# locales as you wish. All of these examples are active by default:[m
[32m+[m[32m# ActiveSupport::Inflector.inflections(:en) do |inflect|[m
[32m+[m[32m#   inflect.plural /^(ox)$/i, '\1en'[m
[32m+[m[32m#   inflect.singular /^(ox)en/i, '\1'[m
[32m+[m[32m#   inflect.irregular 'person', 'people'[m
[32m+[m[32m#   inflect.uncountable %w( fish sheep )[m
[32m+[m[32m# end[m
[32m+[m
[32m+[m[32m# These inflection rules are supported but not enabled by default:[m
[32m+[m[32m# ActiveSupport::Inflector.inflections(:en) do |inflect|[m
[32m+[m[32m#   inflect.acronym 'RESTful'[m
[32m+[m[32m# end[m
[1mdiff --git a/config/initializers/mime_types.rb b/config/initializers/mime_types.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..dc18996[m
[1m--- /dev/null[m
[1m+++ b/config/initializers/mime_types.rb[m
[36m@@ -0,0 +1,4 @@[m
[32m+[m[32m# Be sure to restart your server when you modify this file.[m
[32m+[m
[32m+[m[32m# Add new mime types for use in respond_to blocks:[m
[32m+[m[32m# Mime::Type.register "text/richtext", :rtf[m
[1mdiff --git a/config/initializers/session_store.rb b/config/initializers/session_store.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..bdcfe0c[m
[1m--- /dev/null[m
[1m+++ b/config/initializers/session_store.rb[m
[36m@@ -0,0 +1,3 @@[m
[32m+[m[32m# Be sure to restart your server when you modify this file.[m
[32m+[m
[32m+[m[32mRails.application.config.session_store :cookie_store, key: '_workspace_session'[m
[1mdiff --git a/config/initializers/wrap_parameters.rb b/config/initializers/wrap_parameters.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..33725e9[m
[1m--- /dev/null[m
[1m+++ b/config/initializers/wrap_parameters.rb[m
[36m@@ -0,0 +1,14 @@[m
[32m+[m[32m# Be sure to restart your server when you modify this file.[m
[32m+[m
[32m+[m[32m# This file contains settings for ActionController::ParamsWrapper which[m
[32m+[m[32m# is enabled by default.[m
[32m+[m
[32m+[m[32m# Enable parameter wrapping for JSON. You can disable this by setting :format to an empty array.[m
[32m+[m[32mActiveSupport.on_load(:action_controller) do[m
[32m+[m[32m  wrap_parameters format: [:json] if respond_to?(:wrap_parameters)[m
[32m+[m[32mend[m
[32m+[m
[32m+[m[32m# To enable root element in JSON for ActiveRecord objects.[m
[32m+[m[32m# ActiveSupport.on_load(:active_record) do[m
[32m+[m[32m#  self.include_root_in_json = true[m
[32m+[m[32m# end[m
[1mdiff --git a/config/locales/en.yml b/config/locales/en.yml[m
[1mnew file mode 100644[m
[1mindex 0000000..0653957[m
[1m--- /dev/null[m
[1m+++ b/config/locales/en.yml[m
[36m@@ -0,0 +1,23 @@[m
[32m+[m[32m# Files in the config/locales directory are used for internationalization[m
[32m+[m[32m# and are automatically loaded by Rails. If you want to use locales other[m
[32m+[m[32m# than English, add the necessary files in this directory.[m
[32m+[m[32m#[m
[32m+[m[32m# To use the locales, use `I18n.t`:[m
[32m+[m[32m#[m
[32m+[m[32m#     I18n.t 'hello'[m
[32m+[m[32m#[m
[32m+[m[32m# In views, this is aliased to just `t`:[m
[32m+[m[32m#[m
[32m+[m[32m#     <%= t('hello') %>[m
[32m+[m[32m#[m
[32m+[m[32m# To use a different locale, set it with `I18n.locale`:[m
[32m+[m[32m#[m
[32m+[m[32m#     I18n.locale = :es[m
[32m+[m[32m#[m
[32m+[m[32m# This would use the information in config/locales/es.yml.[m
[32m+[m[32m#[m
[32m+[m[32m# To learn more, please read the Rails Internationalization guide[m
[32m+[m[32m# available at http://guides.rubyonrails.org/i18n.html.[m
[32m+[m
[32m+[m[32men:[m
[32m+[m[32m  hello: "Hello world"[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..3f66539[m
[1m--- /dev/null[m
[1m+++ b/config/routes.rb[m
[36m@@ -0,0 +1,56 @@[m
[32m+[m[32mRails.application.routes.draw do[m
[32m+[m[32m  # The priority is based upon order of creation: first created -> highest priority.[m
[32m+[m[32m  # See how all your routes lay out with "rake routes".[m
[32m+[m
[32m+[m[32m  # You can have the root of your site routed with "root"[m
[32m+[m[32m  # root 'welcome#index'[m
[32m+[m
[32m+[m[32m  # Example of regular route:[m
[32m+[m[32m  #   get 'products/:id' => 'catalog#view'[m
[32m+[m
[32m+[m[32m  # Example of named route that can be invoked with purchase_url(id: product.id)[m
[32m+[m[32m  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase[m
[32m+[m
[32m+[m[32m  # Example resource route (maps HTTP verbs to controller actions automatically):[m
[32m+[m[32m  #   resources :products[m
[32m+[m
[32m+[m[32m  # Example resource route with options:[m
[32m+[m[32m  #   resources :products do[m
[32m+[m[32m  #     member do[m
[32m+[m[32m  #       get 'short'[m
[32m+[m[32m  #       post 'toggle'[m
[32m+[m[32m  #     end[m
[32m+[m[32m  #[m
[32m+[m[32m  #     collection do[m
[32m+[m[32m  #       get 'sold'[m
[32m+[m[32m  #     end[m
[32m+[m[32m  #   end[m
[32m+[m
[32m+[m[32m  # Example resource route with sub-resources:[m
[32m+[m[32m  #   resources :products do[m
[32m+[m[32m  #     resources :comments, :sales[m
[32m+[m[32m  #     resource :seller[m
[32m+[m[32m  #   end[m
[32m+[m
[32m+[m[32m  # Example resource route with more complex sub-resources:[m
[32m+[m[32m  #   resources :products do[m
[32m+[m[32m  #     resources :comments[m
[32m+[m[32m  #     resources :sales do[m
[32m+[m[32m  #       get 'recent', on: :collection[m
[32m+[m[32m  #     end[m
[32m+[m[32m  #   end[m
[32m+[m
[32m+[m[32m  # Example resource route with concerns:[m
[32m+[m[32m  #   concern :toggleable do[m
[32m+[m[32m  #     post 'toggle'[m
[32m+[m[32m  #   end[m
[32m+[m[32m  #   resources :posts, concerns: :toggleable[m
[32m+[m[32m  #   resources :photos, concerns: :toggleable[m
[32m+[m
[32m+[m[32m  # Example resource route within a namespace:[m
[32m+[m[32m  #   namespace :admin do[m
[32m+[m[32m  #     # Directs /admin/products/* to Admin::ProductsController[m
[32m+[m[32m  #     # (app/controllers/admin/products_controller.rb)[m
[32m+[m[32m  #     resources :products[m
[32m+[m[32m  #   end[m
[32m+[m[32mend[m
[1mdiff --git a/config/secrets.yml b/config/secrets.yml[m
[1mnew file mode 100644[m
[1mindex 0000000..1815341[m
[1m--- /dev/null[m
[1m+++ b/config/secrets.yml[m
[36m@@ -0,0 +1,22 @@[m
[32m+[m[32m# Be sure to restart your server when you modify this file.[m
[32m+[m
[32m+[m[32m# Your secret key is used for verifying the integrity of signed cookies.[m
[32m+[m[32m# If you change this key, all old signed cookies will become invalid![m
[32m+[m
[32m+[m[32m# Make sure the secret is at least 30 characters and all random,[m
[32m+[m[32m# no regular words or you'll be exposed to dictionary attacks.[m
[32m+[m[32m# You can use `rake secret` to generate a secure secret key.[m
[32m+[m
[32m+[m[32m# Make sure the secrets in this file are kept private[m
[32m+[m[32m# if you're sharing your code publicly.[m
[32m+[m
[32m+[m[32mdevelopment:[m
[32m+[m[32m  secret_key_base: 446679dfd37d231ad48e0b0a5bf8ee74b8eb3ca9818fe2b0059bde32d4e39dcd2c2f3cc9a05798e121b4face44afabc1f5e608bd099e6cac477b96f55d985b77[m
[32m+[m
[32m+[m[32mtest:[m
[32m+[m[32m  secret_key_base: 1bb7872c37eec25dcf360f45a088065eeaf504da9a0d42c06de9fa22640e568be0d9cf3ec966fe3be90bb388be47ca26097822447f4512cc5958781d0a8fda36[m
[32m+[m
[32m+[m[32m# Do not keep production secrets in the repository,[m
[32m+[m[32m# instead read values from the environment.[m
[32m+[m[32mproduction:[m
[32m+[m[32m  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>[m
[1mdiff --git a/db/seeds.rb b/db/seeds.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..4edb1e8[m
[1m--- /dev/null[m
[1m+++ b/db/seeds.rb[m
[36m@@ -0,0 +1,7 @@[m
[32m+[m[32m# This file should contain all the record creation needed to seed the database with its default values.[m
[32m+[m[32m# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).[m
[32m+[m[32m#[m
[32m+[m[32m# Examples:[m
[32m+[m[32m#[m
[32m+[m[32m#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])[m
[32m+[m[32m#   Mayor.create(name: 'Emanuel', city: cities.first)[m
[1mdiff --git a/lib/assets/.keep b/lib/assets/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/lib/tasks/.keep b/lib/tasks/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/log/.keep b/log/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/public/404.html b/public/404.html[m
[1mnew file mode 100644[m
[1mindex 0000000..b612547[m
[1m--- /dev/null[m
[1m+++ b/public/404.html[m
[36m@@ -0,0 +1,67 @@[m
[32m+[m[32m<!DOCTYPE html>[m
[32m+[m[32m<html>[m
[32m+[m[32m<head>[m
[32m+[m[32m  <title>The page you were looking for doesn't exist (404)</title>[m
[32m+[m[32m  <meta name="viewport" content="width=device-width,initial-scale=1">[m
[32m+[m[32m  <style>[m
[32m+[m[32m  body {[m
[32m+[m[32m    background-color: #EFEFEF;[m
[32m+[m[32m    color: #2E2F30;[m
[32m+[m[32m    text-align: center;[m
[32m+[m[32m    font-family: arial, sans-serif;[m
[32m+[m[32m    margin: 0;[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  div.dialog {[m
[32m+[m[32m    width: 95%;[m
[32m+[m[32m    max-width: 33em;[m
[32m+[m[32m    margin: 4em auto 0;[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  div.dialog > div {[m
[32m+[m[32m    border: 1px solid #CCC;[m
[32m+[m[32m    border-right-color: #999;[m
[32m+[m[32m    border-left-color: #999;[m
[32m+[m[32m    border-bottom-color: #BBB;[m
[32m+[m[32m    border-top: #B00100 solid 4px;[m
[32m+[m[32m    border-top-left-radius: 9px;[m
[32m+[m[32m    border-top-right-radius: 9px;[m
[32m+[m[32m    background-color: white;[m
[32m+[m[32m    padding: 7px 12% 0;[m
[32m+[m[32m    box-shadow: 0 3px 8px rgba(50, 50, 50, 0.17);[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  h1 {[m
[32m+[m[32m    font-size: 100%;[m
[32m+[m[32m    color: #730E15;[m
[32m+[m[32m    line-height: 1.5em;[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  div.dialog > p {[m
[32m+[m[32m    margin: 0 0 1em;[m
[32m+[m[32m    padding: 1em;[m
[32m+[m[32m    background-color: #F7F7F7;[m
[32m+[m[32m    border: 1px solid #CCC;[m
[32m+[m[32m    border-right-color: #999;[m
[32m+[m[32m    border-left-color: #999;[m
[32m+[m[32m    border-bottom-color: #999;[m
[32m+[m[32m    border-bottom-left-radius: 4px;[m
[32m+[m[32m    border-bottom-right-radius: 4px;[m
[32m+[m[32m    border-top-color: #DADADA;[m
[32m+[m[32m    color: #666;[m
[32m+[m[32m    box-shadow: 0 3px 8px rgba(50, 50, 50, 0.17);[m
[32m+[m[32m  }[m
[32m+[m[32m  </style>[m
[32m+[m[32m</head>[m
[32m+[m
[32m+[m[32m<body>[m
[32m+[m[32m  <!-- This file lives in public/404.html -->[m
[32m+[m[32m  <div class="dialog">[m
[32m+[m[32m    <div>[m
[32m+[m[32m      <h1>The page you were looking for doesn't exist.</h1>[m
[32m+[m[32m      <p>You may have mistyped the address or the page may have moved.</p>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <p>If you are the application owner check the logs for more information.</p>[m
[32m+[m[32m  </div>[m
[32m+[m[32m</body>[m
[32m+[m[32m</html>[m
[1mdiff --git a/public/422.html b/public/422.html[m
[1mnew file mode 100644[m
[1mindex 0000000..a21f82b[m
[1m--- /dev/null[m
[1m+++ b/public/422.html[m
[36m@@ -0,0 +1,67 @@[m
[32m+[m[32m<!DOCTYPE html>[m
[32m+[m[32m<html>[m
[32m+[m[32m<head>[m
[32m+[m[32m  <title>The change you wanted was rejected (422)</title>[m
[32m+[m[32m  <meta name="viewport" content="width=device-width,initial-scale=1">[m
[32m+[m[32m  <style>[m
[32m+[m[32m  body {[m
[32m+[m[32m    background-color: #EFEFEF;[m
[32m+[m[32m    color: #2E2F30;[m
[32m+[m[32m    text-align: center;[m
[32m+[m[32m    font-family: arial, sans-serif;[m
[32m+[m[32m    margin: 0;[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  div.dialog {[m
[32m+[m[32m    width: 95%;[m
[32m+[m[32m    max-width: 33em;[m
[32m+[m[32m    margin: 4em auto 0;[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  div.dialog > div {[m
[32m+[m[32m    border: 1px solid #CCC;[m
[32m+[m[32m    border-right-color: #999;[m
[32m+[m[32m    border-left-color: #999;[m
[32m+[m[32m    border-bottom-color: #BBB;[m
[32m+[m[32m    border-top: #B00100 solid 4px;[m
[32m+[m[32m    border-top-left-radius: 9px;[m
[32m+[m[32m    border-top-right-radius: 9px;[m
[32m+[m[32m    background-color: white;[m
[32m+[m[32m    padding: 7px 12% 0;[m
[32m+[m[32m    box-shadow: 0 3px 8px rgba(50, 50, 50, 0.17);[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  h1 {[m
[32m+[m[32m    font-size: 100%;[m
[32m+[m[32m    color: #730E15;[m
[32m+[m[32m    line-height: 1.5em;[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  div.dialog > p {[m
[32m+[m[32m    margin: 0 0 1em;[m
[32m+[m[32m    padding: 1em;[m
[32m+[m[32m    background-color: #F7F7F7;[m
[32m+[m[32m    border: 1px solid #CCC;[m
[32m+[m[32m    border-right-color: #999;[m
[32m+[m[32m    border-left-color: #999;[m
[32m+[m[32m    border-bottom-color: #999;[m
[32m+[m[32m    border-bottom-left-radius: 4px;[m
[32m+[m[32m    border-bottom-right-radius: 4px;[m
[32m+[m[32m    border-top-color: #DADADA;[m
[32m+[m[32m    color: #666;[m
[32m+[m[32m    box-shadow: 0 3px 8px rgba(50, 50, 50, 0.17);[m
[32m+[m[32m  }[m
[32m+[m[32m  </style>[m
[32m+[m[32m</head>[m
[32m+[m
[32m+[m[32m<body>[m
[32m+[m[32m  <!-- This file lives in public/422.html -->[m
[32m+[m[32m  <div class="dialog">[m
[32m+[m[32m    <div>[m
[32m+[m[32m      <h1>The change you wanted was rejected.</h1>[m
[32m+[m[32m      <p>Maybe you tried to change something you didn't have access to.</p>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <p>If you are the application owner check the logs for more information.</p>[m
[32m+[m[32m  </div>[m
[32m+[m[32m</body>[m
[32m+[m[32m</html>[m
[1mdiff --git a/public/500.html b/public/500.html[m
[1mnew file mode 100644[m
[1mindex 0000000..061abc5[m
[1m--- /dev/null[m
[1m+++ b/public/500.html[m
[36m@@ -0,0 +1,66 @@[m
[32m+[m[32m<!DOCTYPE html>[m
[32m+[m[32m<html>[m
[32m+[m[32m<head>[m
[32m+[m[32m  <title>We're sorry, but something went wrong (500)</title>[m
[32m+[m[32m  <meta name="viewport" content="width=device-width,initial-scale=1">[m
[32m+[m[32m  <style>[m
[32m+[m[32m  body {[m
[32m+[m[32m    background-color: #EFEFEF;[m
[32m+[m[32m    color: #2E2F30;[m
[32m+[m[32m    text-align: center;[m
[32m+[m[32m    font-family: arial, sans-serif;[m
[32m+[m[32m    margin: 0;[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  div.dialog {[m
[32m+[m[32m    width: 95%;[m
[32m+[m[32m    max-width: 33em;[m
[32m+[m[32m    margin: 4em auto 0;[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  div.dialog > div {[m
[32m+[m[32m    border: 1px solid #CCC;[m
[32m+[m[32m    border-right-color: #999;[m
[32m+[m[32m    border-left-color: #999;[m
[32m+[m[32m    border-bottom-color: #BBB;[m
[32m+[m[32m    border-top: #B00100 solid 4px;[m
[32m+[m[32m    border-top-left-radius: 9px;[m
[32m+[m[32m    border-top-right-radius: 9px;[m
[32m+[m[32m    background-color: white;[m
[32m+[m[32m    padding: 7px 12% 0;[m
[32m+[m[32m    box-shadow: 0 3px 8px rgba(50, 50, 50, 0.17);[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  h1 {[m
[32m+[m[32m    font-size: 100%;[m
[32m+[m[32m    color: #730E15;[m
[32m+[m[32m    line-height: 1.5em;[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  div.dialog > p {[m
[32m+[m[32m    margin: 0 0 1em;[m
[32m+[m[32m    padding: 1em;[m
[32m+[m[32m    background-color: #F7F7F7;[m
[32m+[m[32m    border: 1px solid #CCC;[m
[32m+[m[32m    border-right-color: #999;[m
[32m+[m[32m    border-left-color: #999;[m
[32m+[m[32m    border-bottom-color: #999;[m
[32m+[m[32m    border-bottom-left-radius: 4px;[m
[32m+[m[32m    border-bottom-right-radius: 4px;[m
[32m+[m[32m    border-top-color: #DADADA;[m
[32m+[m[32m    color: #666;[m
[32m+[m[32m    box-shadow: 0 3px 8px rgba(50, 50, 50, 0.17);[m
[32m+[m[32m  }[m
[32m+[m[32m  </style>[m
[32m+[m[32m</head>[m
[32m+[m
[32m+[m[32m<body>[m
[32m+[m[32m  <!-- This file lives in public/500.html -->[m
[32m+[m[32m  <div class="dialog">[m
[32m+[m[32m    <div>[m
[32m+[m[32m      <h1>We're sorry, but something went wrong.</h1>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <p>If you are the application owner check the logs for more information.</p>[m
[32m+[m[32m  </div>[m
[32m+[m[32m</body>[m
[32m+[m[32m</html>[m
[1mdiff --git a/public/favicon.ico b/public/favicon.ico[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/public/robots.txt b/public/robots.txt[m
[1mnew file mode 100644[m
[1mindex 0000000..3c9c7c0[m
[1m--- /dev/null[m
[1m+++ b/public/robots.txt[m
[36m@@ -0,0 +1,5 @@[m
[32m+[m[32m# See http://www.robotstxt.org/robotstxt.html for documentation on how to use the robots.txt file[m
[32m+[m[32m#[m
[32m+[m[32m# To ban all spiders from the entire site uncomment the next two lines:[m
[32m+[m[32m# User-agent: *[m
[32m+[m[32m# Disallow: /[m
[1mdiff --git a/test/controllers/.keep b/test/controllers/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/test/fixtures/.keep b/test/fixtures/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/test/helpers/.keep b/test/helpers/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/test/integration/.keep b/test/integration/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/test/mailers/.keep b/test/mailers/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/test/models/.keep b/test/models/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/test/test_helper.rb b/test/test_helper.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..92e39b2[m
[1m--- /dev/null[m
[1m+++ b/test/test_helper.rb[m
[36m@@ -0,0 +1,10 @@[m
[32m+[m[32mENV['RAILS_ENV'] ||= 'test'[m
[32m+[m[32mrequire File.expand_path('../../config/environment', __FILE__)[m
[32m+[m[32mrequire 'rails/test_help'[m
[32m+[m
[32m+[m[32mclass ActiveSupport::TestCase[m
[32m+[m[32m  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.[m
[32m+[m[32m  fixtures :all[m
[32m+[m
[32m+[m[32m  # Add more helper methods to be used by all tests here...[m
[32m+[m[32mend[m
[1mdiff --git a/vendor/assets/javascripts/.keep b/vendor/assets/javascripts/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/vendor/assets/stylesheets/.keep b/vendor/assets/stylesheets/.keep[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
