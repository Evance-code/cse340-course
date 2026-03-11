-- Projects table
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    organization_id INTEGER NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES organization(organization_id)
);

-- Categories table
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Junction table (many-to-many between projects and categories)
CREATE TABLE project_category (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- Insert projects
INSERT INTO project (name, description, organization_id)
VALUES
    ('Community Garden Build', 'Building raised garden beds in local neighborhoods.', 1),
    ('Urban Farm Volunteer Day', 'Help plant and harvest crops at our urban farm.', 2),
    ('Charity Run Support', 'Assist with organizing and running a local charity run.', 3);

-- Insert categories
INSERT INTO category (name)
VALUES
    ('Environment'),
    ('Community'),
    ('Health & Wellness');

-- Associate projects with categories
INSERT INTO project_category (project_id, category_id)
VALUES
    (1, 1), (1, 2),
    (2, 1), (2, 3),
    (3, 2), (3, 3);