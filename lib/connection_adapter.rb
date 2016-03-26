class SqliteAdapter
  def initialize
    require 'sqlite3'
    @db = SQLite3::Database.new(File.dirname(__FILE__) + '/../db/app.db', results_as_hash: true)
  end

  # Execute a SQL query and return the results as a hash
  def execute(sql)
    @db.execute(sql).each do |row|
      row.keys.each { |key| row[(key.to_sym rescue key) || key] = row.delete(key) }
    end
  end

  def columns(table_name)
    @db.table_info(table_name).map { |info| info['name'].to_sym }
  end
end

class MySQLAdapater
  def execute(sql)
    # code for executing a query in SQL
  end

  def columns(to_symcolumn)
    # code for getting columns from MySQL
  end
end
