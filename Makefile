.PHONY: clean all

POSTS_MD_FOLDER		:= posts/markdown
POSTS_HTML_FOLDER	:= posts
POSTS_MDS					:= $(wildcard $(POSTS_MD_FOLDER)/*.md)
POSTS_HTML				:= $(POSTS_MDS:$(POSTS_MD_FOLDER)/%.md=$(POSTS_HTML_FOLDER)/%.html)

PANDOC								:= pandoc
PANDOC_POST_TEMPLATE	:= templates/post_template.html
PANDOC_FLAGS					:= --standalone
PANDOC_FLAGS					+= --template $(PANDOC_POST_TEMPLATE)
PANDOC_FLAGS					+= --highlight-style=pygments

$(POSTS_HTML_FOLDER)/%.html: $(POSTS_MD_FOLDER)/%.md $(PANDOC_POST_TEMPLATE) Makefile
	$(PANDOC) $(PANDOC_FLAGS) $< -o $@

all: index.html $(POSTS_HTML)

clean:
	rm -f $(POSTS_HTML_FOLDER)/*.html
