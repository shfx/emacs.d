(defun +buffer-region-text ()
  (if (not (use-region-p))
      nil
    (save-mark-and-excursion 
      (when (< (point) (mark))
        (exchange-point-and-mark))

      (let (n min text (end (region-end)))
        (when (= end (line-beginning-position))
          (setq end (1- end)))

        (setq text (buffer-substring-no-properties (region-beginning) end))
        
        (with-temp-buffer
          (insert text)
          (goto-char (point-min))
          (untabify (point-min) (point-max))

          ;; Unindent copied text
          (while (search-forward-regexp "^\\(\s*\\)[^\b]" nil t)
            (setq n (length (match-string 1)))
            (when (or (null min) (< n min))
              (setq min n)))

          (when (and (not (null min)) (> min 0))
            (indent-rigidly (point-min) (point-max) (- min)))
          (buffer-string))))))

(defun +find-buffer-by-mode (mode)
  (unless mode
    (error "No mode provided"))
  (let ((buffers (mapcar #'buffer-name (seq-filter
                                        (lambda (buf)                    
                                          (with-current-buffer buf       
                                            (derived-mode-p mode)))      
                                        (buffer-list)))))
    (if buffers (with-current-buffer (completing-read "Buffer: " buffers nil t))
      (message "No buffers found with mode: %s" mode)
      nil)))

(defun +region-lines ()
  (if (not (use-region-p))
      (line-number-at-pos (point) t)
    (save-mark-and-excursion
      (when (< (point) (mark))
        (exchange-point-and-mark))
      (let ((first (line-number-at-pos (mark) t))
            (last (- (line-number-at-pos (point) t) (if (bolp) 1 0))))
        (format "%s-%s" first last)))))

(defun +get-filename-lines (&optional dirname)
  (if (not (buffer-file-name))
      (message "Not a file visiting buffer")
    (let* ((file (file-relative-name (buffer-file-name) dirname))
           (lines (+region-lines)))
      (format "%s:%s" file lines))))

(defun +ghostel-paste (text buffer)
  (with-current-buffer buffer
    (ghostel--paste-text text)))

(defun +ghostel-paste-filename ()
  (unless (buffer-file-name)
    (error "Not a file visiting buffer"))
  (let* ((buffer (+find-buffer-by-mode 'ghostel-mode))
         (dirname (with-current-buffer buffer default-directory)))
    (+ghostel-paste (+get-filename-lines dirname) buffer)))

(defun +pi-copy-and-paste-region ()
  (unless (buffer-file-name)
    (error "Not a file visiting buffer"))
  (let* ((text (+buffer-region-text))
         (buffer (+find-buffer-by-mode 'ghostel-mode))
         (dirname (with-current-buffer buffer default-directory))
         (filename (+get-filename-lines dirname)))

    (when (null text)
      (error "No text extracted"))
         
    (+ghostel-paste (format "`%s`\n```\n%s\n```\n" filename "dupa") buffer)
    (deactivate-mark)))

