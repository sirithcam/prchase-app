@currencies =
  %w[AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BRL BSD BTN BWP BYN BZD CAD CDF CHF
       CLP CNY COP CRC CUC CUP CVE CZK DJF DKK DOP DZD EGP ERN ETB EUR FJD FKP GBP GEL GGP GHS GIP GMD GNF GTQ GYD HKD
       HNL HRK HTG HUF IDR ILS IMP INR IQD IRR ISK JEP JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD
       LSL LYD MAD MDL MGA MKD MMK MNT MOP MRU MUR MVR MWK MXN MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR
       PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SLL SOS SPL SRD STN SVC SYP SZL THB TJS TMT TND TOP TRY
       TTD TVD TWD TZS UAH UGX USD UYU UZS VEF VES VND]

class PurchaseIntent < ApplicationRecord
  validates :user_id, :book_id, :price, :currency, :payment_method, presence: true
  validates :purchase_id, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :currency, inclusion: @currencies, presence: true
end
