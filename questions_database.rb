require "sqlite3"
require "singleton"

class QuestionsDBConnection < SQLite3::Database
    include Singleton

    def initialize
        super("questions.db")
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Users
    attr_accessor :id, :first_name, :last_name
    def self.all
        data = QuestionsDBConnection.instance.execute("SELECT * FROM users")
        data.map { |datum| Users.new(datum) }
    end

    # def self.find_by_first_name(first_name)
    #     SELECT
    #         *
    #     FROM
    #         users
    #     WHERE
    #         first_name = ?
    #     SQL
    #     return nil unless user.length > 0
    #     Users.new(user.first)
    # end

    def initialize(options)
        @id = options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
    end

    def create
        raise "#{self} already in database" if self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.first_name, self.last_name)
            INSERT INTO
            users (first_name, last_name)
            VALUES
                (?, ?)
        SQL
        self.id = QuestionsDBConnection.instance.last_insert_row_id
     end


    def update
        raise "#{self} not in database" unless self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.first_name, self.last_name)
            UPDATE
            users
            SET
                first_name = ?, last_name = ?
            WHERE
                id = ?
            SQL
    end
end

