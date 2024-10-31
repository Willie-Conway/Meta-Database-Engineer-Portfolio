-- Create the version_control database
CREATE DATABASE IF NOT EXISTS version_control;

-- Switch to the version_control database
USE version_control;

-- Create the VersionControl table
CREATE TABLE IF NOT EXISTS VersionControl (
    VCSystemID INT NOT NULL AUTO_INCREMENT,  -- Unique ID for each version control system
    VCName VARCHAR(50) NOT NULL,  -- Name of the version control system
    ReleaseYear INT NOT NULL,  -- Year of release
    KeyFeatures TEXT,  -- Key features of the system
    PRIMARY KEY (VCSystemID)  -- Primary key for the table
);

-- Insert data for various version control systems
INSERT INTO VersionControl (VCName, ReleaseYear, KeyFeatures)
VALUES
('CVS', 1986, 'First significant VCS, lacks integrity checks, primarily for text files'),
('Subversion (SVN)', 2000, 'Improved data integrity, better binary file support, centralized model'),
('Mercurial', 2005, 'High-performance distributed VCS, easy transition from SVN'),
('Git', 2005, 'Distributed VCS, popularized by GitHub, ideal for open-source projects');
