/*
 *  escape.h
 *  weibo4objc
 *
 *  Created by fanng yuan on 12/21/10.
 *  Copyright 2010 fanngyuan@sina. All rights reserved.
 *
 */

/*
 * NAME curl_easy_escape()
 *
 * DESCRIPTION
 *
 * Escapes URL strings (converts all letters consider illegal in URLs to their
 * %XX versions). This function returns a new allocated string or NULL if an
 * error occurred.
 */
char *urlEscape(const char *string,
                                   int length);

/* the previous version */
char *urlUnescape(const char *string,
                                int length);
