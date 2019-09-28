# frozen_string_literal: true

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test "compain is valid with all attributes" do
    umbrella = Company.new(name: "Umbrella",
                               legal_representant_name: "Aaron Barreto",
                               legal_representant_email: "arron@marketing.io",
                               legal_representant_phone: "312-002-0000",
                               legal_representant_role: "CTO",
                               bussines_name: "Umbrella SA",
                               rfc: "123LLK314LJDU786",
                               location: "RaconCity")
    assert umbrella.valid?
  end

  test "campain is not valid with no mame" do
    umbrella = Company.new(legal_representant_name: "Aaron Barreto",
                               legal_representant_email: "arron@marketing.io",
                               legal_representant_phone: "312-002-0000",
                               legal_representant_role: "CTO",
                               bussines_name: "Umbrella SA",
                               rfc: "123LLK314LJDU786",
                               location: "RaconCity")
    refute umbrella.valid?
  end

  test "campain is not valid with no legal representant name" do
    umbrella = Company.new(name: "Umbrella",
                               legal_representant_email: "arron@marketing.io",
                               legal_representant_phone: "312-002-0000",
                               legal_representant_role: "CTO",
                               bussines_name: "Umbrella SA",
                               rfc: "123LLK314LJDU786",
                               location: "RaconCity")
    refute umbrella.valid?
  end

  test "campain is not valid with no legal representant email" do
    umbrella = Company.new(name: "Umbrella",
                               legal_representant_name: "Aaron Barreto",
                               legal_representant_phone: "312-002-0000",
                               legal_representant_role: "CTO",
                               bussines_name: "Umbrella SA",
                               rfc: "123LLK314LJDU786",
                               location: "RaconCity")
    refute umbrella.valid?
  end

  test "campain is not valid with no legal representant phone" do
    umbrella = Company.new(name: "Umbrella",
                               legal_representant_name: "Aaron Barreto",
                               legal_representant_email: "arron@marketing.io",
                               legal_representant_role: "CTO",
                               bussines_name: "Umbrella SA",
                               rfc: "123LLK314LJDU786",
                               location: "RaconCity")
    refute umbrella.valid?
  end

  test "campain is not valid with no legal representant role" do
    umbrella = Company.new(name: "Umbrella",
                               legal_representant_name: "Aaron Barreto",
                               legal_representant_email: "arron@marketing.io",
                               legal_representant_phone: "312-002-0000",
                               bussines_name: "Umbrella SA",
                               rfc: "123LLK314LJDU786",
                               location: "RaconCity")
    refute umbrella.valid?
  end

  test "compain is not valid with no bussines name" do
    umbrella = Company.new(name: "Umbrella",
                               legal_representant_name: "Aaron Barreto",
                               legal_representant_email: "arron@marketing.io",
                               legal_representant_phone: "312-002-0000",
                               legal_representant_role: "CTO",
                               rfc: "123LLK314LJDU786",
                               location: "RaconCity")
    refute umbrella.valid?
  end

  test "compain is not valit with no rfc" do
    umbrella = Company.new(name: "Umbrella",
                               legal_representant_name: "Aaron Barreto",
                               legal_representant_email: "arron@marketing.io",
                               legal_representant_phone: "312-002-0000",
                               legal_representant_role: "CTO",
                               bussines_name: "Umbrella SA",
                               location: "RaconCity")
    refute umbrella.valid?
  end

  test "compain is not valid with no location" do
    umbrella = Company.new(name: "Umbrella",
                               legal_representant_name: "Aaron Barreto",
                               legal_representant_email: "arron@marketing.io",
                               legal_representant_phone: "312-002-0000",
                               legal_representant_role: "CTO",
                               bussines_name: "Umbrella SA",
                               rfc: "123LLK314LJDU786")
    refute umbrella.valid?
  end
end
