class Employee < ActiveRecord::Base
  validates :name, presence: true, format: {with: /[А-ШЭ-Я][а-я]* [А-ШЭ-Я][а-я]* [А-ШЭ-Я][а-я]*/, message:"требуется ФИО разделенные пробелами"}
  validate :contact_email_or_phone
  validates :salary, presence: true, numericality: { only_integer: true }

  def contact_email_or_phone
    errors.add(:contact, "введите email или номер телефона") unless contact =~ /\+[0-9]{7,15}/ || EmailValidator.valid?(contact)
  end
end
