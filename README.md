# ARU KORE — ASP.NET Web Forms

Personal portfolio website built with ASP.NET Web Forms, C#, ADO.NET and SQL Server.

## Requirements
- Visual Studio 2022 with the **ASP.NET and web development** workload
- .NET Framework 4.8 Developer Pack
- SQL Server 2019 / SQL Server Express (or LocalDB)
- SQL Server Management Studio (SSMS)

## Folder layout
```
ARUKORE.sln                  Open this in Visual Studio
Database/ARUKORE.sql         Creates the database, tables and sample data
ARUKORE/                     The web project
  ARUKORE.csproj
  Web.config                 Settings and the database connection string
  Site.Master (+ .cs/.designer.cs)   Shared layout
  Default.aspx (+ .cs/.designer.cs)  Home page
  Contact.aspx (+ .cs/.designer.cs)  Contact form
  DbHelper.cs                Shared database code
  Content/site.css           Styles
  Properties/AssemblyInfo.cs
```

## Setup (do these in order)
1. **Create the database.** Open `Database/ARUKORE.sql` in SSMS and press F5.
2. **Set the connection string.** Open `ARUKORE/Web.config` and change `Data Source` to your SQL Server name (the name you type in the SSMS login box). The default is `.\SQLEXPRESS`. Other common values: `.` or `localhost` (default instance), `(LocalDB)\MSSQLLocalDB`.
3. **Open the solution.** Double-click `ARUKORE.sln`.
4. **Build.** Choose **Build > Rebuild Solution**.
5. **Run.** Press F5. The home page should show skills and projects from the database.

## Troubleshooting
- **"Could not load type 'ARUKORE.SiteMaster'"** — the project did not build. Fix the errors in the Error List, delete the `bin` and `obj` folders, then Rebuild.
- **"Content is temporarily unavailable"** on the home page — the database is not reachable. In debug mode the reason is shown next to the message. Usually the `Data Source` is wrong, or `ARUKORE.sql` was not run.
- **Contact form says "could not save"** — same cause; check the connection string and that the `ContactMessages` table exists.

## Git commands
Run these from the folder that contains `ARUKORE.sln`:

```bash
git init
git add .
git commit -m "Initial ASP.NET Web Forms portfolio"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/ARUKORE.git
git push -u origin main
```

Create the empty GitHub repository first and replace the URL above with your own.

## Important
- Never commit passwords, production connection strings, API keys or personal secrets.
- Update the sample projects, email and social links before publishing.
- This is a starter project. Add anti-spam protection and HTTPS before using the contact form publicly.
