// File: build.gradle.kts (root project)

plugins {
    id("com.google.gms.google-services") version "4.4.4" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Optional: Relocate build outputs
val newBuildDir = rootProject.layout.buildDirectory
    .dir("../../build")
    .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)

    evaluationDependsOn(":app") // Combine both subprojects blocks
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
