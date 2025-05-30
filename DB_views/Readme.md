# Football League Database

A relational database designed to manage all core elements of a football league, including teams, players, matches, venues, referees, and seasons. Implemented in T‑SQL on Microsoft SQL Server.

---

## Features

* **Schema Design**: Normalized relational model with tables for Teams, Players, Matches, Venues, Referees, Seasons.
* **Data Population**: Automated SQL scripts (`DB_project.sql` & `DB_insert.sql`) to create schema and insert sample data.
* **Reporting Views**: Predefined SQL views for:

  * League Standings
  * Match Schedules
  * Top Scorers
  * Team Performance Metrics
* **Version Control**: All scripts tracked in Git repository.
* **Diagram**: Entity–Relationship (EER) diagram illustrating tables, keys, and relationships.

---

## Prerequisites

* Microsoft SQL Server (2017 or later)
* SQL Server Management Studio (SSMS)
* Git (for version control)

---

## Installation & Setup

1. **Clone the Repository**

   ```bash
   git clone https://github.com/AdhamNasreldin/Football-League-Database.git
   cd Football-League-Database
   ```

2. **Create Database and Schema**

   * Open `DB_project.sql` in SSMS.
   * Execute the script to create a new database (e.g., `FootballLeagueDB`) and all tables with constraints.

3. **Insert Sample Data**

   * Open `DB_insert.sql` in SSMS.
   * Execute the script to populate tables with sample teams, players, matches, etc.

4. **Explore Reporting Views**

   * In SSMS, expand the `Views` folder under your database.
   * Run `SELECT * FROM [view_name];` to inspect standings, schedules, and other metrics.

---

## Database Schema

![EER Diagram](docs/EER_diagram.png)

Key tables:

* **Teams**: `TeamID`, `Name`, `HomeCity`, `FoundedYear`
* **Players**: `PlayerID`, `FirstName`, `LastName`, `Position`, `BirthDate`, `TeamID`
* **Matches**: `MatchID`, `HomeTeamID`, `AwayTeamID`, `VenueID`, `MatchDate`
* **Venues**: `VenueID`, `Name`, `City`, `Capacity`
* **Referees**: `RefereeID`, `FirstName`, `LastName`, `QualificationLevel`
* **Seasons**: `SeasonID`, `Year`, `StartDate`, `EndDate`

---

## Usage Examples

* **League Standings**:

  ```sql
  SELECT * FROM LeagueStandingsView;
  ```

* **Upcoming Matches**:

  ```sql
  SELECT * FROM MatchScheduleView WHERE MatchDate > GETDATE();
  ```

* **Top Scorers**:

  ```sql
  SELECT * FROM TopScorersView ORDER BY Goals DESC;
  ```

---

## Contributing

Contributions are welcome! Please fork the repo and submit a pull request with your changes.

---

## License

This project is licensed under the MIT License. See `LICENSE` for details.

---

## Acknowledgments

* Inspired by academic and industry best practices in sports management systems.
* Tools: SQL Server, SSMS, ERDPlus for diagramming.
