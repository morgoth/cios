module PartnersHelper
  def partner_kinds_collection
    Partner::KINDS.map { |kind| [t("partner.#{kind}"), kind] }
  end
end
