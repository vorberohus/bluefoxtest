class Employee < ActiveRecord::Base
  validates :name, presence: true, format: {with: /[А-ШЭ-Я][а-я]* [А-ШЭ-Я][а-я]* [А-ШЭ-Я][а-я]*/, message:"требуется ФИО разделенные пробелами"}
end
