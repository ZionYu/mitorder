require 'spec_helper'

describe UserMailer do
  describe 'notify_order_create' do
    order = Order.create(name: "Qoo", email:"test@example.com", address:"ooooo")
    let(:name) { 'Qoo' } 
    let(:mail) { described_class.notify_order_create(order).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eql("Studio M | 訂購明細")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([order.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['ialways0311@gmail.com'])
    end

  end
end