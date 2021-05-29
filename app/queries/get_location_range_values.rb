class GetLocationRangeValues < BaseQuery

  def perform(range)
    relation
      .where("location = ?",range[1].to_s)
  end
end