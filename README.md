# Music Library Management
| **Backend** | J2EE (Java) |
| **CSS Framework** | Bootstrap (4.4.1) |

|Tools Used| Version |
|--|--|
| Eclipse IDE | neon.3 |
| JDK | 8 / 1.8 |
| Oracle DB | 11g XE |
| Apache Tomcat Server | 9.0.34 |

## Create Database Tables (Users, Musics, Artists & Favorites)
**Use Sqlplus to run all the queries**
```
CREATE TABLE USERS(
    username VARCHAR2(50) NOT NULL,
    password VARCHAR2(50) NOT NULL,
    role VARCHAR2(50) NOT NULL,
    PRIMARY KEY(username)
);

CREATE TABLE MUSICS(
    name VARCHAR2(50) NOT NULL,
    artist VARCHAR2(50) NOT NULL,
    url VARCHAR2(100) NOT NULL
);

CREATE TABLE ARTISTS(
    name VARCHAR2(50) NOT NULL,
    UNIQUE(name)
);

CREATE TABLE FAVORITES(
    username VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    artist VARCHAR2(50) NOT NULL,
    url VARCHAR2(100) NOT NULL
);
```
**Fix your connection statement line with your db credentials and schemas if necessary before running on server**
