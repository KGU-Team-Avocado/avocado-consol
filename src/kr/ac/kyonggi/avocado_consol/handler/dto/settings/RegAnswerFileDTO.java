package kr.ac.kyonggi.avocado_consol.handler.dto.settings;

public class RegAnswerFileDTO {
    public int id, reg_id;
    public String original_FileName, real_FileName, writer_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReg_id() {
        return reg_id;
    }

    public void setReg_id(int reg_id) {
        this.reg_id = reg_id;
    }

    public String getOriginal_FileName() {
        return original_FileName;
    }

    public void setOriginal_FileName(String original_FileName) {
        this.original_FileName = original_FileName;
    }

    public String getReal_FileName() {
        return real_FileName;
    }

    public void setReal_FileName(String real_FileName) {
        this.real_FileName = real_FileName;
    }

    public String getWriter_id() {
        return writer_id;
    }

    public void setWriter_id(String writer_id) {
        this.writer_id = writer_id;
    }
}
