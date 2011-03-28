module BQ
  class ImportStatus
    def initialize(table,import_id)
      data = {
        :method => 'bigquery.imports.get',
        :params => {:table_name => table, :import_id => import_id}
      }
      result = BQ.request(:post, data.to_json)

      return result
    end
  end
end
