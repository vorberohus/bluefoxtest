@BF.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Employee extends App.BaseEntities.Model
    urlRoot: Routes.employees_path()

  class Entities.Employees extends App.BaseEntities.Collection
    model: Entities.Employee
    url: Routes.employees_path()

  API =
    getStaticEmployees: ->
      new Entities.Employees [
         id: 1
         name: 'Александр Александрович Александров'
         contact: '+7925000000'
         status: true
         salary: 100500
         skills: ['ruby', 'javascript','backbone']
        ,
         id: 2
         name: 'Александр Александрович Александров'
         contact: '+7925000000'
         status: false
         salary: 100500
         skills: ['ruby', 'javascript', 'ruby-on-rails', 'mongodb']
        ,
         id: 3
         name: 'Александр Александрович Александров'
         contact: '+7925000000'
         status: true
         salary: 100500
         skills: ['ruby', 'javascript', 'backbone']
      ]

    getStaticEmployee: ->
      new Entities.Employee
        id: 1
        name: 'Александр Александрович Александров'
        contact: '+7925000000'
        status: false
        salary: 100500
        skills: ['ruby', 'javascript','backbone']

    getEmployees: ->
      employees = new Entities.Employees
      employees.fetch
        reset: true
      employees

    getEmployee: (id) ->
      employee = new Entities.Employee
        id: id
      employee.fetch()
      employee

    newEmployee: ->
      new Entities.Employee
        name: ''
        contact: ''
        status: false
        salary: 0

   App.reqres.setHandler 'get:employees:entities', ->
     API.getEmployees()

   App.reqres.setHandler 'get:employee:entity', (id) ->
     API.getEmployee(id)

   App.reqres.setHandler 'new:employee:entity', ->
     API.newEmployee()
