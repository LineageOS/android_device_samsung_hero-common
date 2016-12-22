enum device_variant {
    G930F,
    G930S,
    G930K,
    G930L,
    G930W8,
    G935F,
    G935S,
    G935K,
    G935L,
    G935W8,
};

device_variant match(std::string bl)
{
    if (bl == "G930F") {
        return G930F;
    } else if (bl == "G930W8") {
        return G930W8;
    } else if (bl == "G930S") {
        return G930S;
    } else if (bl == "G930K") {
        return G930K;
    } else if (bl == "G930L") {
        return G930L;
    } else if (bl == "G935S") {
        return G935S;
    } else if (bl == "G935K") {
        return G935K;
    } else if (bl == "G935L") {
        return G935L;
    } else if (bl == "G935W8") {
        return G935W8;
    } else {
        return G935F;
    }
}