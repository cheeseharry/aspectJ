public aspect InterAspect {

    // creates a new interface named HasName
    private interface HasName{}
    // make HasName has a field named name
    private String HasName.name;
    // make HasName has a method getName() and default implemented
    public String HasName.getName() {
        return name;
    }

    // make HasName has a method named setName and default
    public void HasName.setName(String name) {
        this.name = name;
    }
}
