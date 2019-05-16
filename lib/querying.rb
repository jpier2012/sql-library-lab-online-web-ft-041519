def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
  FROM books
  INNER JOIN series ON books.series_id = series.id
  WHERE series.id = (SELECT MIN(id) FROM series)
  ORDER BY books.year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT c.name, c.motto
  FROM characters c
  ORDER BY LENGTH(c.motto) DESC LIMIT 1;"
end

def select_value_and_count_of_most_prolific_species
  "SELECT c.species, COUNT(c.species)
  FROM characters c
  GROUP BY c.species
  ORDER BY COUNT(c.species) DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM authors
  INNER JOIN series ON series.author_id = authors.id
  INNER JOIN subgenres ON subgenres.id = series.subgenre_id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
  FROM characters
  JOIN series ON series.id = characters.series_id
  GROUP BY series.title, characters.species
  ORDER BY COUNT(*) DESC LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(*)
  FROM characters
  INNER JOIN character_books ON characters.id = character_books.character_id
  GROUP BY characters.name
  ORDER BY COUNT(*) DESC;"
end
