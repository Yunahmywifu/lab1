package com.example.lab1.model;

public class Artist {
    private int id;
    private String name;
    private String country;
    private String genre;
    private int yearFounded;

    public Artist() {}

    public Artist(int id, String name, String country, String genre, int yearFounded) {
        this.id = id;
        this.name = name;
        this.country = country;
        this.genre = genre;
        this.yearFounded = yearFounded;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public int getYearFounded() { return yearFounded; }
    public void setYearFounded(int yearFounded) { this.yearFounded = yearFounded; }
}

