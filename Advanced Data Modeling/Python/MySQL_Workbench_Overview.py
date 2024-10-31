# Overview of MySQL Workbench functionalities
class MySQLWorkbench:
    def __init__(self):
        self.features = {
            "Visual Database Design": self.visual_database_design(),
            "Forward and Reverse Engineering": self.forward_reverse_engineering(),
            "Database Management": self.database_management(),
            "Database Documentation": self.database_documentation(),
            "Visual SQL Editor": self.visual_sql_editor(),
            "Visual Database Administration": self.visual_database_administration(),
            "Data Management": self.data_management(),
            "Database Migration": self.database_migration(),
        }

    def visual_database_design(self):
        return """
        MySQL Workbench allows for creating visualized ER diagrams 
        that simplify the database design process. It enables 
        database engineers to document requirements clearly and 
        communicate design ideas with stakeholders.
        """

    def forward_reverse_engineering(self):
        return """
        - Forward Engineering: Create a data model in the visual designer and generate SQL schema 
          automatically for MySQL server.
        - Reverse Engineering: Import a MySQL database file to create a model, which can be modified 
          before re-engineering.
        """

    def database_management(self):
        return """
        MySQL Workbench enables schema synchronization and 
        comparison to manage different versions of database schemas.
        """

    def database_documentation(self):
        return """
        DBDoc tool allows database engineers to generate 
        documentation of database design in HTML or plain text formats.
        """

    def visual_sql_editor(self):
        return """
        The visual SQL editor provides:
        - SQL code completion
        - Syntax highlighting
        - Query history
        - SQL snippets
        - Code formatting
        """

    def visual_database_administration(self):
        return """
        MySQL Workbench offers complete administrative control 
        over MySQL server including user accounts, roles, privileges, 
        and server configuration.
        """

    def data_management(self):
        return """
        Features for managing data include:
        - Import/export of mysqldump files
        - Export query results as CSV, XML, HTML
        - Visual Data Editor for viewing and editing result sets.
        """

    def database_migration(self):
        return """
        Database Migration Wizard allows migration between MySQL versions 
        and various relational database management systems.
        """


# Instantiate MySQLWorkbench to access its features
mysql_workbench = MySQLWorkbench()
for feature, description in mysql_workbench.features.items():
    print(f"{feature}:\n{description}\n")
