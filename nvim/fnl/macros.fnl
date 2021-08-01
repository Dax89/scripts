(fn use-pkg [name]
  `(use [,name]))

(fn nv-cmd [...]
  `(each [_# cmd# (ipairs [,...])]
     (vim.cmd cmd#)))

(fn nv-opt [opt ...]
  `(let [options# [,...]]
     (for [i# 1 (length options#) 2]
       (let [k# (. options# i#) v# (. options# (+ i# 1))]
         (tset (. vim ,(tostring opt)) k# v#)))))

{ : use-pkg
  : nv-opt
  : nv-cmd }
