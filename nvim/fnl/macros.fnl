(fn use-pkg [name]
  `(use [,name]))

(fn nv-cmd [...]
  `(each [_# cmd# (ipairs [,...])]
     (vim.cmd cmd#)))

(fn nv-fn [name ...]
  `((. vim.fn ,(tostring name)) ,...))

(fn nv-opt [opt ...]
  `(let [options# [,...]]
     (for [i# 1 (length options#) 2]
       (let [k# (. options# i#) v# (. options# (+ i# 1))]
         (tset (. vim ,(tostring opt)) k# v#)))))

(fn with-require [name ...]
  `(let [,name (require ,(tostring name))]
    (do ,...)))

(fn with-require [name ...]
  `(let [,name (require ,(tostring name))]
    (do ,...)))

(fn with-require-as [altname name ...]
  `(let [,altname (require ,(tostring name))]
    (do ,...)))

(fn plugin-setup [name func ...]
  `(let [p# (require ,(tostring name))]
    ((. p# ,(tostring func)) ,...)))


{ : use-pkg
  : nv-cmd
  : nv-fn
  : nv-opt
  : with-require
  : with-require-as
  : plugin-setup }
