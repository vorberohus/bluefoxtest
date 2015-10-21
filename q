[1mdiff --git a/Bowerfile b/Bowerfile[m
[1mindex 54ea18f..04cc028 100644[m
[1m--- a/Bowerfile[m
[1m+++ b/Bowerfile[m
[36m@@ -1,6 +1,7 @@[m
 # A sample Bowerfile[m
 # Check out https://github.com/42dev/bower-rails#ruby-dsl-configuration for more options[m
 [m
[32m+[m[32masset 'spin', git: 'git@github.com:fgnass/spin.js.git'[m
 asset 'backbone.syphon'[m
 asset 'marionette'[m
 asset 'foundation'[m
[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex d259fdc..9196234 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -31,6 +31,7 @@[m [mgem 'gon'[m
 # bundle exec rake doc:rails generates the API under doc/api.[m
 gem 'sdoc', '~> 0.4.0', group: :doc[m
 [m
[32m+[m[32mgem 'email_validator'[m
 # Use ActiveModel has_secure_password[m
 # gem 'bcrypt', '~> 3.1.7'[m
 [m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex f88bb6b..9337b94 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -57,6 +57,8 @@[m [mGEM[m
       eco-source[m
       execjs[m
     eco-source (1.1.0.rc.1)[m
[32m+[m[32m    email_validator (1.6.0)[m
[32m+[m[32m      activemodel[m
     erubis (2.7.0)[m
     eventmachine (1.0.8)[m
     execjs (2.6.0)[m
[36m@@ -201,6 +203,7 @@[m [mDEPENDENCIES[m
   byebug[m
   coffee-rails (~> 4.1.0)[m
   eco[m
[32m+[m[32m  email_validator[m
   factory_girl_rails[m
   foundation-icons-sass-rails[m
   gon[m
[1mdiff --git a/app/assets/javascripts/application.js b/app/assets/javascripts/application.js[m
[1mindex 978c91f..e29b1cb 100644[m
[1m--- a/app/assets/javascripts/application.js[m
[1m+++ b/app/assets/javascripts/application.js[m
[36m@@ -21,13 +21,14 @@[m
 //= require backbone.syphon[m
 //= require marionette[m
 //= require js-routes[m
[32m+[m[32m//= require spin[m
 //[m
 //= require_tree ./config[m
 //[m
 //= require ./backbone/app[m
 //[m
 //= require_tree ./backbone/lib/entities[m
[31m-//= require_tree ./backbone/lib/controllers[m
[32m+[m[32m//= require_tree ./backbone/lib/actions[m
 //= require_tree ./backbone/lib/views[m
 //= require_tree ./backbone/lib/utilities[m
 //= require_tree ./backbone/lib/components[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/dashboard/dashboard_app.js.coffee b/app/assets/javascripts/backbone/apps/dashboard/dashboard_app.js.coffee[m
[1mindex 2c2d92e..7dc7c10 100644[m
[1m--- a/app/assets/javascripts/backbone/apps/dashboard/dashboard_app.js.coffee[m
[1m+++ b/app/assets/javascripts/backbone/apps/dashboard/dashboard_app.js.coffee[m
[36m@@ -6,7 +6,7 @@[m
 [m
   API =[m
     show: ->[m
[31m-      new DashboardApp.Show.Controller[m
[32m+[m[32m      new DashboardApp.Show.Action[m
 [m
   App.addInitializer ->[m
     new DashboardApp.Router[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/dashboard/show/controller.js.coffee b/app/assets/javascripts/backbone/apps/dashboard/show/controller.js.coffee[m
[1mdeleted file mode 100644[m
[1mindex 315b974..0000000[m
[1m--- a/app/assets/javascripts/backbone/apps/dashboard/show/controller.js.coffee[m
[1m+++ /dev/null[m
[36m@@ -1,10 +0,0 @@[m
[31m-@BF.module "DashboardApp.Show", (Show, App, Backbone, Marionette, $, _) ->[m
[31m-[m
[31m-  class Show.Controller extends App.Controllers.Application[m
[31m-[m
[31m-    initialize: ->[m
[31m-      @layout = @getLayout()[m
[31m-      @show @layout[m
[31m-[m
[31m-    getLayout: ->[m
[31m-      new Show.Layout[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/employees/edit/controller.js.coffee b/app/assets/javascripts/backbone/apps/employees/edit/controller.js.coffee[m
[1mdeleted file mode 100644[m
[1mindex 2a9e66b..0000000[m
[1m--- a/app/assets/javascripts/backbone/apps/employees/edit/controller.js.coffee[m
[1m+++ /dev/null[m
[36m@@ -1,25 +0,0 @@[m
[31m-@BF.module "EmployeesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->[m
[31m-[m
[31m-  class Edit.Controller extends App.Controllers.Application[m
[31m-[m
[31m-    initialize: (id) ->[m
[31m-      employee = App.request 'get:employee:entity', id[m
[31m-      App.execute 'when:fetched', employee, =>[m
[31m-        console.log employee[m
[31m-        layout = @getLayout()[m
[31m-        @listenTo layout, 'show', ->[m
[31m-          employee_view = @getEmployeeView employee[m
[31m-          form_view = App.request 'form:wrapper', employee_view[m
[31m-          layout.formRegion.show form_view[m
[31m-        @show layout[m
[31m-[m
[31m-    getLayout: ->[m
[31m-      new Edit.Layout[m
[31m-[m
[31m-    getEmployeeView: (employee) ->[m
[31m-      new Edit.EmployeeView[m
[31m-        model: employee[m
[31m-  [m
[31m-  App.reqres.setHandler 'get:edit:view', (model) ->[m
[31m-    new Edit.EmployeeView[m
[31m-      model: model[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/employees/edit/templates/employee.jst.eco b/app/assets/javascripts/backbone/apps/employees/edit/templates/employee.jst.eco[m
[1mindex 08e0b06..59fba2e 100644[m
[1m--- a/app/assets/javascripts/backbone/apps/employees/edit/templates/employee.jst.eco[m
[1m+++ b/app/assets/javascripts/backbone/apps/employees/edit/templates/employee.jst.eco[m
[36m@@ -13,7 +13,7 @@[m
       <label for='contact' class='right'>Контакт</label>[m
     </div>[m
     <div class='large-6 columns left'>[m
[31m-      <input type='text' name='contact' id='contact' value="<%= @contact %>" />[m
[32m+[m[32m      <input type='text' name='contact' id='contact' placeholder="someone@example.com или +7912000000" value="<%= @contact %>" />[m
     </div>[m
   </div>[m
   <div class='row'>[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/employees/edit/views.js.coffee b/app/assets/javascripts/backbone/apps/employees/edit/views.js.coffee[m
[1mindex ff516a7..b9b4abd 100644[m
[1m--- a/app/assets/javascripts/backbone/apps/employees/edit/views.js.coffee[m
[1m+++ b/app/assets/javascripts/backbone/apps/employees/edit/views.js.coffee[m
[36m@@ -3,6 +3,6 @@[m
   class Edit.EmployeeView extends App.Views.ItemView[m
     template: 'employees/edit/employee'[m
 [m
[31m-    form:[m
[32m+[m[32m    form: ->[m
       buttons:[m
         placement: 'left'[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/employees/employees_app.js.coffee b/app/assets/javascripts/backbone/apps/employees/employees_app.js.coffee[m
[1mindex c987a4b..0158689 100644[m
[1m--- a/app/assets/javascripts/backbone/apps/employees/employees_app.js.coffee[m
[1m+++ b/app/assets/javascripts/backbone/apps/employees/employees_app.js.coffee[m
[36m@@ -9,16 +9,17 @@[m
 [m
   API =[m
     index: ->[m
[31m-      new EmployeesApp.Index.Controller[m
[32m+[m[32m      new EmployeesApp.Index.Action[m
[32m+[m
[32m+[m[32m    new: ->[m
[32m+[m[32m      new EmployeesApp.New.Action[m
     [m
     show: (id) ->[m
[31m-      new EmployeesApp.Show.Controller[m
[32m+[m[32m      new EmployeesApp.Show.Action id[m
 [m
     edit: (id) ->[m
[31m-      new EmployeesApp.Edit.Controller id[m
[32m+[m[32m      new EmployeesApp.Edit.Action id[m
 [m
[31m-    new: ->[m
[31m-      new EmployeesApp.New.Controller[m
 [m
   App.addInitializer ->[m
     new EmployeesApp.Router[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/employees/index/controller.js.coffee b/app/assets/javascripts/backbone/apps/employees/index/controller.js.coffee[m
[1mdeleted file mode 100644[m
[1mindex 79d443f..0000000[m
[1m--- a/app/assets/javascripts/backbone/apps/employees/index/controller.js.coffee[m
[1m+++ /dev/null[m
[36m@@ -1,24 +0,0 @@[m
[31m-@BF.module "EmployeesApp.Index", (Index, App, Backbone, Marionette, $, _) ->[m
[31m-[m
[31m-  class Index.Controller extends App.Controllers.Application[m
[31m-[m
[31m-    initialize: ->[m
[31m-      employees = App.request 'get:employees:entities'[m
[31m-      App.execute 'when:fetched', employees, =>[m
[31m-        layout = @getLayoutView()[m
[31m-        @listenTo layout, 'show', ->[m
[31m-          list_header_view = @getListHeaderView()[m
[31m-          list_view = @getListView employees[m
[31m-          layout.listHeaderRegion.show list_header_view[m
[31m-          layout.listRegion.show list_view[m
[31m-        @show layout[m
[31m-[m
[31m-    getLayoutView: ->[m
[31m-      new Index.Layout[m
[31m-[m
[31m-    getListHeaderView: ->[m
[31m-      new Index.ListHeaderView[m
[31m-[m
[31m-    getListView: (employees) ->[m
[31m-      new Index.ListView[m
[31m-        collection: employees[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/employees/index/templates/_employee.jst.eco b/app/assets/javascripts/backbone/apps/employees/index/templates/_employee.jst.eco[m
[1mindex 4425111..77859c8 100644[m
[1m--- a/app/assets/javascripts/backbone/apps/employees/index/templates/_employee.jst.eco[m
[1m+++ b/app/assets/javascripts/backbone/apps/employees/index/templates/_employee.jst.eco[m
[36m@@ -9,21 +9,21 @@[m
   <div class="large-9 columns info">[m
     <div class="row">[m
       <div class="large-9 columns"><h5><%- @linkTo @name, Routes.edit_employee_path(@id) %></h5></div>[m
[31m-      <div class="large-3 columns"><a href="#" class="button tiny alert right">удалить</a></div>[m
[32m+[m[32m      <div class="large-3 columns"><button data-button-role='delete' class="button tiny alert right">удалить</button></div>[m
     </div>[m
     <div class="row ">[m
       <div class="large-6 columns about">[m
         <div class="row">[m
[31m-          <div class="large-5 columns text-right">Контакты</div>[m
[31m-          <div class="large-7 columns"><%= @contact %></div>[m
[32m+[m[32m          <div class="large-4 columns text-right">Контакт</div>[m
[32m+[m[32m          <div class="large-8 columns"><%= @contact %></div>[m
         </div>[m
         <div class="row">[m
[31m-          <div class="large-5 columns text-right">Зарплата</div>[m
[31m-          <div class="large-7 columns"><%= @salary %></div>[m
[32m+[m[32m          <div class="large-4 columns text-right">Зарплата</div>[m
[32m+[m[32m          <div class="large-8 columns"><%= @salary %></div>[m
         </div>[m
         <div class="row">[m
[31m-          <div class="large-5 columns text-right">Статус</div>[m
[31m-          <div class="large-7 columns">[m
[32m+[m[32m          <div class="large-4 columns text-right">Статус</div>[m
[32m+[m[32m          <div class="large-8 columns">[m
             <span class="<%= "not" unless @status %> seeks-job text-center"><%= if @status then "Ищет работу" else "Не ищет работу" %></span>[m
           </div>[m
         </div>[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/employees/index/templates/list_header.jst.eco b/app/assets/javascripts/backbone/apps/employees/index/templates/list_header.jst.eco[m
[1mindex 108b441..6ed4d43 100644[m
[1m--- a/app/assets/javascripts/backbone/apps/employees/index/templates/list_header.jst.eco[m
[1m+++ b/app/assets/javascripts/backbone/apps/employees/index/templates/list_header.jst.eco[m
[36m@@ -3,6 +3,6 @@[m
 </div>[m
 <div class="large-1 columns">[m
   <div class="total text-center right">[m
[31m-    0[m
[32m+[m[32m    <%= @items.length %>[m
   </div>[m
 </div>[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/employees/index/views.js.coffee b/app/assets/javascripts/backbone/apps/employees/index/views.js.coffee[m
[1mindex 648c95f..4233218 100644[m
[1m--- a/app/assets/javascripts/backbone/apps/employees/index/views.js.coffee[m
[1m+++ b/app/assets/javascripts/backbone/apps/employees/index/views.js.coffee[m
[36m@@ -4,14 +4,21 @@[m
     template: 'employees/index/list_header'[m
     className: 'row list-header'[m
 [m
[31m-  class Index.EmployeeView extends App.Views.ItemView[m
[31m-    template: 'employees/index/_employee'[m
[31m-    tagName: 'li'[m
[32m+[m[32m    collectionEvents:[m
[32m+[m[32m      'reset update': 'render'[m
 [m
   class Index.EmptyView extends App.Views.ItemView[m
     template: 'employees/index/_empty'[m
     tagName: 'li'[m
 [m
[32m+[m[32m  class Index.EmployeeView extends App.Views.ItemView[m
[32m+[m[32m    template: 'employees/index/_employee'[m
[32m+[m[32m    tagName: 'li'[m
[32m+[m
[32m+[m[32m    triggers:[m
[32m+[m[32m      'click button[data-button-role=delete]':'delete:button:click'[m
[32m+[m
[32m+[m
   class Index.ListView extends App.Views.CompositeView[m
     template: 'employees/index/list'[m
     tagName: 'ul'[m
[36m@@ -19,3 +26,5 @@[m
     childView: Index.EmployeeView[m
     emptyView: Index.EmptyView[m
 [m
[32m+[m[32m    childEvents:[m
[32m+[m[32m      'delete:button:click': (view, args) -> @trigger 'delete:button:click', view, args[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/employees/new/controller.js.coffee b/app/assets/javascripts/backbone/apps/employees/new/controller.js.coffee[m
[1mdeleted file mode 100644[m
[1mindex 8a42553..0000000[m
[1m--- a/app/assets/javascripts/backbone/apps/employees/new/controller.js.coffee[m
[1m+++ /dev/null[m
[36m@@ -1,24 +0,0 @@[m
[31m-@BF.module "EmployeesApp.New", (New, App, Backbone, Marionette, $, _) ->[m
[31m-[m
[31m-  class New.Controller extends App.Controllers.Application[m
[31m-[m
[31m-    initialize: ->[m
[31m-      layout = @getLayoutView()[m
[31m-      @listenTo layout, 'show', ->[m
[31m-        employee = App.request 'new:employee:entity'[m
[31m-[m
[31m-        @listenTo employee, 'sync', ->[m
[31m-          App.execute 'info:alert', 'aaa'[m
[31m-          App.navigate Routes.employees_path(), trigger: true[m
[31m-[m
[31m-        @listenTo employee, 'error', ->[m
[31m-          console.log 'error', employee[m
[31m-[m
[31m-        edit_view = App.request 'get:edit:view', employee[m
[31m-        form_view = App.request 'form:wrapper', edit_view[m
[31m-[m
[31m-        layout.newEmployeeRegion.show form_view[m
[31m-      @show layout[m
[31m-[m
[31m-    getLayoutView: ->[m
[31m-      new New.Layout[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/employees/show/controller.js.coffee b/app/assets/javascripts/backbone/apps/employees/show/controller.js.coffee[m
[1mdeleted file mode 100644[m
[1mindex 1ec028e..0000000[m
[1m--- a/app/assets/javascripts/backbone/apps/employees/show/controller.js.coffee[m
[1m+++ /dev/null[m
[36m@@ -1,10 +0,0 @@[m
[31m-@BF.module "EmployeesApp.Show", (Show, App, Backbone, Marionette, $, _) ->[m
[31m-[m
[31m-  class Show.Controller extends App.Controllers.Application[m
[31m-[m
[31m-    initialize: ->[m
[31m-      @layout = @getLayout()[m
[31m-      @show @layout[m
[31m-[m
[31m-    getLayout: ->[m
[31m-      new Show.Layout[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/header/header_app.js.coffee b/app/assets/javascripts/backbone/apps/header/header_app.js.coffee[m
[1mindex 79bf8c1..3affe28 100644[m
[1m--- a/app/assets/javascripts/backbone/apps/header/header_app.js.coffee[m
[1m+++ b/app/assets/javascripts/backbone/apps/header/header_app.js.coffee[m
[36m@@ -4,7 +4,7 @@[m
 [m
   API =[m
     show: ->[m
[31m-      new HeaderApp.Show.Controller[m
[32m+[m[32m      new HeaderApp.Show.Action[m
         region: App.headerRegion[m
 [m
   HeaderApp.on "start", ->[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/header/show/controller.js.coffee b/app/assets/javascripts/backbone/apps/header/show/controller.js.coffee[m
[1mdeleted file mode 100644[m
[1mindex 9af730a..0000000[m
[1m--- a/app/assets/javascripts/backbone/apps/header/show/controller.js.coffee[m
[1m+++ /dev/null[m
[36m@@ -1,12 +0,0 @@[m
[31m-@BF.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->[m
[31m-[m
[31m-  class Show.Controller extends App.Controllers.Application[m
[31m-[m
[31m-    initialize: ->[m
[31m-      menu = App.request 'get:header:menu:entities'[m
[31m-      view = @getHeaderView(menu)[m
[31m-      @show view[m
[31m-[m
[31m-    getHeaderView: (entities) ->[m
[31m-      new Show.MenuView[m
[31m-        collection: entities[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/info/info_app.js.coffee b/app/assets/javascripts/backbone/apps/info/info_app.js.coffee[m
[1mindex 3e8da08..2c3d5a8 100644[m
[1m--- a/app/assets/javascripts/backbone/apps/info/info_app.js.coffee[m
[1m+++ b/app/assets/javascripts/backbone/apps/info/info_app.js.coffee[m
[36m@@ -1,6 +1,6 @@[m
 @BF.module "InfoApp", (InfoApp, App, Backbone, Marionette, $, _) ->[m
 [m
   App.commands.setHandler 'info:alert', (message) ->[m
[31m-    new InfoApp.Show.Controller[m
[32m+[m[32m    new InfoApp.Show.Action[m
       region: App.infoRegion[m
       message: message[m
[1mdiff --git a/app/assets/javascripts/backbone/apps/info/show/controller.js.coffee b/app/assets/javascripts/backbone/apps/info/show/controller.js.coffee[m
[1mdeleted file mode 100644[m
[1mindex 92fc981..0000000[m
[1m--- a/app/assets/javascripts/backbone/apps/info/show/controller.js.coffee[m
[1m+++ /dev/null[m
[36m@@ -1,6 +0,0 @@[m
[31m-@BF.module "InfoApp.Show", (Show, App, Backbone, Marionette, $, _) ->[m
[31m-[m
[31m-  class Show.Controller extends App.Controllers.Application[m
[31m-[m
[31m-    ininialize: ->[m
[31m-[m
[1mdiff --git a/app/assets/javascripts/backbone/entities/abstract/form_buttons.js.coffee b/app/assets/javascripts/backbone/entities/abstract/form_buttons.js.coffee[m
[1mindex 0c18413..3510982 100644[m
[1m--- a/app/assets/javascripts/backbone/entities/abstract/form_buttons.js.coffee[m
[1m+++ b/app/assets/javascripts/backbone/entities/abstract/form_buttons.js.coffee[m
[36m@@ -24,6 +24,7 @@[m
         primary: if model.isNew() then 'Создать' else 'Сохранить'[m
         cancel: 'Отмена'[m
         placement: 'right'[m
[32m+[m[32m      buttons[m
 [m
   App.reqres.setHandler 'form:button:entities', (buttons={}, model) ->[m
     API.getFormButtons buttons, model[m
[1mdiff --git a/app/assets/javascripts/backbone/lib/components/form/controller.js.coffee b/app/assets/javascripts/backbone/lib/components/form/controller.js.coffee[m
[1mdeleted file mode 100644[m
[1mindex 4f9d66f..0000000[m
[1m--- a/app/assets/javascripts/backbone/lib/components/form/controller.js.coffee[m
[1m+++ /dev/null[m
[36m@@ -1,51 +0,0 @@[m
[31m-@BF.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->[m
[31m-[m
[31m-  class Form.Controller extends App.Controllers.Application[m
[31m-[m
[31m-    initialize: (options={}) ->[m
[31m-      @content_view = options.view[m
[31m-      @form_layout = @getFormLayout options.config[m
[31m-      @listenTo @form_layout, 'show', @insertContent[m
[31m-      @listenTo @form_layout, 'close', @close[m
[31m-      @listenTo @form_layout, 'form:submit', @formSubmit[m
[31m-[m
[31m-    formSubmit: ->[m
[31m-      data = Backbone.Syphon.serialize @form_layout[m
[31m-      model = @content_view.model[m
[31m-      @processFromSubmit data, model[m
[31m-[m
[31m-    processFromSubmit: (data, model) ->[m
[31m-      model.save data[m
[31m-[m
[31m-    onClose: ->[m
[31m-      console.log "onClose", @[m
[31m-[m
[31m-    insertContent: ->[m
[31m-      @form_layout.formContentRegion.show @content_view[m
[31m-[m
[31m-    getFormLayout: (options={}) ->[m
[31m-      config = @getDefaultConfig _.result @content_view, 'form'[m
[31m-      _.extend config, options[m
[31m-[m
[31m-      buttons = @getButtons config.buttons[m
[31m-[m
[31m-      new Form.FormWrapperLayout[m
[31m-        config: config[m
[31m-        model: @content_view.model[m
[31m-        buttons: buttons[m
[31m-[m
[31m-    getDefaultConfig: (config={}) ->[m
[31m-      _.defaults config,[m
[31m-        footer: true[m
[31m-        focusFirstInput: true[m
[31m-[m
[31m-    getButtons: (buttons={}) ->[m
[31m-      App.request 'form:button:entities', buttons, @content_view.model unless buttons is false[m
[31m-[m
[31m-  App.reqres.setHandler 'form:wrapper', (content_view, options={}) ->[m
[31m-    throw new Error "No model found inside form content view" unless content_view.model[m
[31m-    form_controller = new Form.Controller[m
[31m-      view: content_view[m
[31m-      config: options[m
[31m-[m
[31m-    form_controller.form_layout[m
[1mdiff --git a/app/assets/javascripts/backbone/lib/components/form/layout.js.coffee b/app/assets/javascripts/backbone/lib/components/form/layout.js.coffee[m
[1mindex 5e83aef..4094544 100644[m
[1m--- a/app/assets/javascripts/backbone/lib/components/form/layout.js.coffee[m
[1m+++ b/app/assets/javascripts/backbone/lib/components/form/layout.js.coffee[m
[36m@@ -17,6 +17,10 @@[m
 [m
     triggers:[m
       'submit': 'form:submit'[m
[32m+[m[32m      'click button[data-form-button=cancel]': 'form:cancel'[m
[32m+[m
[32m+[m[32m    modelEvents:[m
[32m+[m[32m      'change:_errors': 'changeErrors'[m
 [m
     ui:[m
       buttonContainer: 'ul.inline-list'[m
[36m@@ -39,3 +43,19 @@[m
     getFormDataType: ->[m
       if @model.isNew() then "new" else "edit"[m
 [m
[32m+[m[32m    changeErrors: (model, errors, options) ->[m
[32m+[m[32m      if @config.errors[m
[32m+[m[32m        if _.isEmpty(errors) then @removeErrors() else @addErrors errors[m
[32m+[m
[32m+[m[32m    removeErrors: ->[m
[32m+[m[32m      @$('.error').removeClass('error').find('small').remove()[m
[32m+[m
[32m+[m[32m    addErrors: (errors={}) ->[m
[32m+[m[32m      for name, array of errors[m
[32m+[m[32m        @addError name, array[0][m
[32m+[m
[32m+[m[32m    addError: (name, error) ->[m
[32m+[m[32m      el = @$("[name='#{name}']")[m
[32m+[m[32m      sm = $("<small>").addClass('error').text(error)[m
[32m+[m[32m      el.after(sm).closest(".row").addClass('error')[m
[32m+[m
[1mdiff --git a/app/assets/javascripts/backbone/lib/controllers/application.js.coffee b/app/assets/javascripts/backbone/lib/controllers/application.js.coffee[m
[1mdeleted file mode 100644[m
[1mindex 80a398c..0000000[m
[1m--- a/app/assets/javascripts/backbone/lib/controllers/application.js.coffee[m
[1m+++ /dev/null[m
[36m@@ -1,11 +0,0 @@[m
[31m-@BF.module "Controllers", (Controllers, App, Backbone, Marionette, $, _) ->[m
[31m-[m
[31m-  class Controllers.Application extends Marionette.Controller[m
[31m-[m
[31m-    constructor: (options={}) ->[m
[31m-      @region = options.region or App.request "default:region"[m
[31m-      super options[m
[31m-[m
[31m-    show: (view) ->[m
[31m-      @listenTo view, "close", @close[m
[31m-      @region.show view[m
[1mdiff --git a/app/assets/javascripts/backbone/lib/entities/collection.js.coffee b/app/assets/javascripts/backbone/lib/entities/collection.js.coffee[m
[1mindex 9e1856d..9e5bed1 100644[m
[1m--- a/app/assets/javascripts/backbone/lib/entities/collection.js.coffee[m
[1m+++ b/app/assets/javascripts/backbone/lib/entities/collection.js.coffee[m
[36m@@ -1,3 +1,4 @@[m
 @BF.module "BaseEntities", (BaseEntities, App, Backbone, Marionette, $, _) ->[m
 [m
[31m-  class BaseEntities.Model extends Backbone.Model[m
[32m+[m[32m  class BaseEntities.Collection extends Backbone.Collection[m
[41m+[m
[1mdiff --git a/app/assets/javascripts/backbone/lib/entities/model.js.coffee b/app/assets/javascripts/backbone/lib/entities/model.js.coffee[m
[1mindex 58d5ac3..88bb61d 100644[m
[1m--- a/app/assets/javascripts/backbone/lib/entities/model.js.coffee[m
[1m+++ b/app/assets/javascripts/backbone/lib/entities/model.js.coffee[m
[36m@@ -1,3 +1,23 @@[m
 @BF.module "BaseEntities", (BaseEntities, App, Backbone, Marionette, $, _) ->[m
 [m
[31m-  class BaseEntities.Collection extends Backbone.Collection[m
[32m+[m[32m  class BaseEntities.Model extends Backbone.Model[m
[32m+[m
[32m+[m[32m    save: (data, options={}) ->[m
[32m+[m[32m      is_new = @isNew()[m
[32m+[m
[32m+[m[32m      _.defaults options,[m
[32m+[m[32m        wait: true[m
[32m+[m[32m        success: _.bind(@saveSuccess, @, is_new)[m
[32m+[m[32m        error: _.bind(@saveError, @)[m
[32m+[m
[32m+[m[32m      @unset '_errors'[m
[32m+[m[32m      super data, options[m
[32m+[m
[32m+[m[32m    saveSuccess: (is_new) =>[m
[32m+[m[32m      if is_new[m
[32m+[m[32m        @trigger 'created', @[m
[32m+[m[32m      else[m
[32m+[m[32m        @trigger 'updated', @[m
[32m+[m
[32m+[m[32m    saveError: (model, xhr, options={}) =>[m
[32m+[m[32m      @set _errors: $.parseJSON(xhr.responseText)?.errors unless xhr.status is 500 or xhr.status is 404[m
[1mdiff --git a/app/assets/javascripts/backbone/lib/utilities/navigation.js.coffee b/app/assets/javascripts/backbone/lib/utilities/navigation.js.coffee[m
[1mindex e26e061..55874e8 100644[m
[1m--- a/app/assets/javascripts/backbone/lib/utilities/navigation.js.coffee[m
[1m+++ b/app/assets/javascripts/backbone/lib/utilities/navigation.js.coffee[m
[36m@@ -4,6 +4,8 @@[m
 [m
     navigate: (route, options={}) ->[m
       #set defaults if needed[m
[32m+[m[32m      route = '#'+route if route.charAt(0) != '#'[m
[32m+[m[32m      console.log route[m
       Backbone.history.navigate route, options[m
 [m
     getCurrentRoute: ->[m
[1mdiff --git a/app/assets/javascripts/backbone/lib/views/view.js.coffee b/app/assets/javascripts/backbone/lib/views/view.js.coffee[m
[1mindex 5d609c7..6aae305 100644[m
[1m--- a/app/assets/javascripts/backbone/lib/views/view.js.coffee[m
[1m+++ b/app/assets/javascripts/backbone/lib/views/view.js.coffee[m
[36m@@ -9,7 +9,7 @@[m
         @[key] = val[m
 [m
     remove: (args...) ->[m
[31m-      console.log "remove", @[m
[32m+[m[32m      console.log 'remove', @[m
       _remove.apply @, args[m
 [m
     templateHelpers: ->[m
[1mdiff --git a/app/assets/javascripts/config/backbone/sync.js.coffee b/app/assets/javascripts/config/backbone/sync.js.coffee[m
[1mindex af9f133..7c0553c 100644[m
[1m--- a/app/assets/javascripts/config/backbone/sync.js.coffee[m
[1m+++ b/app/assets/javascripts/config/backbone/sync.js.coffee[m
[36m@@ -3,10 +3,13 @@[m [mdo (Backbone) ->[m
 [m
   Backbone.sync = (method, entity, options={}) ->[m
     if method in ['create', 'update', 'delete'][m
[31m-      auth_properties = [][m
[32m+[m[32m      auth_properties = {}[m
       auth_properties[$('meta[name=csrf-param]').attr('content')] = $('meta[name=csrf-token]').attr('content')[m
       entity.set auth_properties, silent: true[m
[32m+[m[32m      if method == 'delete'[m
[32m+[m[32m        options.url = entity.url()+'?'+$.param(auth_properties)[m
 [m
[32m+[m[32m    console.log 'sync', entity[m
     sync = _sync method, entity, options[m
 [m
     if !entity._fetch and method is "read"[m
[1mdiff --git a/app/controllers/employees_controller.rb b/app/controllers/employees_controller.rb[m
[1mindex c5b13f4..103c437 100644[m
[1m--- a/app/controllers/employees_controller.rb[m
[1m+++ b/app/controllers/employees_controller.rb[m
[36m@@ -21,6 +21,12 @@[m [mclass EmployeesController < ApplicationController[m
     respond_with @employee[m
   end[m
 [m
[32m+[m[32m  def destroy[m[41m [m
[32m+[m[32m    @employee = Employee.find params[:id][m
[32m+[m[32m    @employee.destroy[m
[32m+[m[32m    respond_with @employee[m
[32m+[m[32m  end[m
[32m+[m
   private[m
   [m
     def employee_params[m
[1mdiff --git a/app/models/employee.rb b/app/models/employee.rb[m
[1mindex e4cafd2..489b1b3 100644[m
[1m--- a/app/models/employee.rb[m
[1m+++ b/app/models/employee.rb[m
[36m@@ -1,3 +1,9 @@[m
 class Employee < ActiveRecord::Base[m
   validates :name, presence: true, format: {with: /[А-ШЭ-Я][а-я]* [А-ШЭ-Я][а-я]* [А-ШЭ-Я][а-я]*/, message:"требуется ФИО разделенные пробелами"}[m
[32m+[m[32m  validate :contact_email_or_phone[m
[32m+[m[32m  validates :salary, presence: true, numericality: { only_integer: true }[m
[32m+[m
[32m+[m[32m  def contact_email_or_phone[m
[32m+[m[32m    errors.add(:contact, "введите email или номер телефона") unless contact =~ /\+[0-9]{7,15}/ || EmailValidator.valid?(contact)[m
[32m+[m[32m  end[m
 end[m
