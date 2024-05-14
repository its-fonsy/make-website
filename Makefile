.PHONY: clean all

POSTS_MDS		:= $(wildcard markdown/*.md)
POSTS_HTML	:= $(POSTS_MDS:markdown/%.md=posts/%.html)

PANDOC								:= pandoc
PANDOC_POST_TEMPLATE	:= post_template.html  
PANDOC_FLAGS					:= --standalone
PANDOC_FLAGS					+= --template $(PANDOC_POST_TEMPLATE)

posts/%.html: markdown/%.md $(PANDOC_POST_TEMPLATE)
	$(PANDOC) $(PANDOC_FLAGS) $< -o $@

all: index.html $(POSTS_HTML)

clean:
	rm -f posts/*
