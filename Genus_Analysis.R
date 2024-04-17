library(tidyverse)


Temp <- read_tsv("C:/Users/Kumar/Downloads/minimalR-raw_data-0.3/minimalR-raw_data-0.3/baxter.subsample.shared")

shared <- read_tsv("C:/Users/Kumar/Downloads/minimalR-raw_data-0.3/minimalR-raw_data-0.3/baxter.subsample.shared",
                   col_types = cols(Group = col_character(),
                                    .default = col_double())) %>%
  rename_all(tolower) %>%
  select(group, starts_with("otu")) %>%
  pivot_longer(-group, names_to="otu", values_to="count")

Temp2 <- read_tsv("C:/Users/Kumar/Downloads/minimalR-raw_data-0.3/minimalR-raw_data-0.3/baxter.cons.taxonomy")

Taxonomy <- read_tsv("C:/Users/Kumar/Downloads/minimalR-raw_data-0.3/minimalR-raw_data-0.3/baxter.cons.taxonomy") %>%
  rename_all(tolower) %>%
  select(otu, taxonomy) %>%
  mutate(otu = tolower(otu),
         taxonomy = str_replace_all(taxonomy, "\\(\\d+\\)", ""),
         taxonomy = str_replace(taxonomy, ";unclassified", "_unclassified"),
         taxonomy = str_replace_all(taxonomy, ";unclassified", ""),
         taxonomy = str_replace_all(taxonomy, ";$", ""),
         taxonomy = str_replace_all(taxonomy, ".*;", "")
  )

 Metadata <- read_tsv("C:/Users/Kumar/Downloads/minimalR-raw_data-0.3/minimalR-raw_data-0.3/baxter.metadata.tsv",
                      col_types=cols(sample = col_character())) %>%
   rename_all(tolower) %>%
   rename(group = sample) %>%
   mutate(srn = dx_bin == "Adv Adenoma" | dx_bin == "Cancer",
          lesion = dx_bin == "Adv Adenoma" | dx_bin == "Cancer" | dx_bin == "Adenoma")
 
 
 composite <- inner_join(shared, Taxonomy, by="otu") %>%
   group_by(group, taxonomy) %>%
   summarize(count = sum(count), .groups="drop") %>%
   group_by(group) %>%
   mutate(rel_abund = count / sum(count)) %>%
   ungroup() %>%
   select(-count) %>%
   inner_join(., Metadata, by="group")
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



